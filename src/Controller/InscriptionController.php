<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Etudiant;
use App\Entity\Filiere;
use App\Entity\Inscription;
use Symfony\Component\HttpFoundation\File\File;
use App\Repository\FiliereRepository;
use App\Repository\PaiementRepository;
use App\Repository\EtudiantRepository;
use App\Repository\InscriptionRepository;

class InscriptionController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index(): Response
    {
        return $this->render('inscription/index.html.twig', [
            'controller_name' => 'InscriptionController',
        ]);
    }

    /**
     * @Route("/inscription", name="inscription")
     */
    public function create(Request $request, FiliereRepository $filiereRepository, PaiementRepository $paiementRepository)
    {
        $em = $this->getDoctrine()->getManager();
        $filiere = $filiereRepository->findAll();
        $paiement = $paiementRepository->findAll();

        if ($request->request->count() > 0) {
            $etudiant = new Etudiant();
            $inscription = new Inscription();
            $filiereInscription = $filiereRepository->findBy(['id' => $request->request->get('filiere')]);
            $paiementInscription = $paiementRepository->findBy(['id' => $request->request->get('paiement')]);
            $etudiant->setFirstName($request->request->get('firstname'))
                ->setLastName($request->request->get('lastname'))
                ->setDatenaiss($request->request->get('datenaiss'))
                ->setAddress($request->request->get('address'))
                ->setEmail($request->request->get('email'))
                ->setPhone($request->request->get('phone'))
                ->setSerie($request->request->get('serie'))
                ->setAnneeBac($request->request->get('anneebac'))
                ->setEcole($request->request->get('ecole'))
                ->setFichierFile($request->request->get('fichier'));

            dump($filiereInscription);
            $inscription->setEtudiant($etudiant)
                ->setFiliere($filiereInscription[0])
                ->setPaiement($paiementInscription[0])
                ->setCreatedAt(new \DateTime('now'));

            $em->persist($etudiant);
            $em->persist($inscription);
            $em->flush();

            //return $this->redirectToRoute('accueil');
            //dump($request);
        }
        return $this->render('inscription/create.html.twig', [
            'filieres' => $filiere,
            'paiements' => $paiement
        ]);
    }

    /**
     * @Route("/liste", name="liste_etudiants")
     */
    public function list(EtudiantRepository $EtudiantRepository, FiliereRepository $filiereRepository, InscriptionRepository $inscriptionRepository)
    {
        $inscription = $inscriptionRepository->findAll();
        $filiereTab = [];
        $listEtudiant = [];
        $listTabFiliere = array();
        foreach ($inscription as $data) {
            $dataEtudiant = $data->getEtudiant();
            $dataFiliere = $data->getFiliere();
            array_push($listEtudiant, [
                "id" => $dataEtudiant->getId(),
                "firstname" => $dataEtudiant->getFirstName(),
                "lastname" => $dataEtudiant->getLastName(),
                "address" => $dataEtudiant->getAddress(),
                "phone" => $dataEtudiant->getPhone(),
                "email" => $dataEtudiant->getEmail(),
                "filiere" => $dataFiliere->getNom()
            ]);
            $filiereCount = $inscriptionRepository->count([
                'filiere' => $data->getFiliere()
            ]);
            array_push($filiereTab, [
                "name" => $dataFiliere->getNom(),
                "count" => $filiereCount
            ]);
        }
        $tableListeFiliere = array_map("unserialize", array_unique(array_map("serialize", $filiereTab)));

        return $this->render('inscription/list.html.twig', [
            'etudiants' => $listEtudiant,
            'filieres' => $tableListeFiliere
        ]);
    }
}
