<?php

namespace App\Entity;

use App\Repository\EtudiantRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=EtudiantRepository::class)
 */
class Etudiant
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\Length(min=5, max=50)
     */
    private $firstname;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\Length(min=5, max=50)
     */
    private $lastname;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $datenaiss;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\Length(min=5, max=50)
     */
    private $address;

    /**
     * @ORM\Column(type="integer")
     */
    private $phone;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\Length(min=10, max=50)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\Length(max=5)
     */
    private $serie;

    /**
     * @ORM\Column(type="integer")
     */
    private $anneeBac;

    /**
     * @ORM\Column(type="string", length=50)
     * @Assert\Length(min=5,max=20)
     */
    private $ecole;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $fichierFile;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstName(): ?string
    {
        return $this->firstname;
    }

    public function setFirstName(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getDatenaiss(): ?string
    {
        return $this->datenaiss;
    }

    public function setDatenaiss(string $datenaiss): self
    {
        $this->datenaiss = $datenaiss;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getPhone(): ?int
    {
        return $this->phone;
    }

    public function setPhone(int $phone): self
    {
        $this->phone = $phone;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getSerie(): ?string
    {
        return $this->serie;
    }

    public function setSerie(string $serie): self
    {
        $this->serie = $serie;

        return $this;
    }

    public function getAnneeBac(): ?int
    {
        return $this->anneeBac;
    }

    public function setAnneeBac(int $anneeBac): self
    {
        $this->anneeBac = $anneeBac;

        return $this;
    }

    public function getEcole(): ?string
    {
        return $this->ecole;
    }

    public function setEcole(string $ecole): self
    {
        $this->ecole = $ecole;

        return $this;
    }

    public function getFichierFile(): ?string
    {
        return $this->fichierFile;
    }

    public function setFichierFile(string $fichierFile): self
    {
        $this->fichierFile = $fichierFile;

        return $this;
    }
}
