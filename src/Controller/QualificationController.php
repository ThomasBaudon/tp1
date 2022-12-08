<?php

namespace App\Controller;

use App\Entity\Qualification;
use App\Repository\QualificationRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class QualificationController extends AbstractController
{
    /* APP_QUALIFICATION */
    #[Route('/qualification', name: 'app_qualification')]
    public function index(QualificationRepository $qualificationRepo): Response
    {
        $qualifs = $qualificationRepo->findAll();
        return $this->render('qualification/index.html.twig', [
            'controller_name' => 'QualificationController',
            'qualifications' => $qualifs,
        ]);
    }


    /* SHOW */
    #[Route('/qualification/{id}', name: 'show_qualification', methods:['GET'])]
    public function show(Request $request, Qualification $qualification, int $id, QualificationRepository $qualificationRepository): Response
    {
        return $this->render('qualification/show.html.twig', [
            'qualification' => $qualification,
        ]);

    }

    /* EDIT */
    #[Route('/qualification/edit/{id}', name: 'edit_qualification', methods:['GET', 'POST'])]
    public function edit(Request $request, QualificationRepository $qualificationRepository, Qualification $qualification)
    {

    }

    /* ADD */
    #[Route('/qualification/add', name: 'add_qualification', methods:['GET', 'POST'])]
    public function add(Request $request, QualificationRepository $qualificationRepository, Qualification $qualification)
    {

    }



    /* SHOW */
    #[Route('/qualification/delete/{id}', name: 'delete_qualification', methods:['GET'])]
    public function delete(Request $request, Qualification $qualification, QualificationRepository $qualificationRepository): Response
    {

        $qualificationRepository->remove($qualification, true);
        return $this->redirectToRoute('app_qualification');

    }

    
    
}
