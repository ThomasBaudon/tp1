<?php

namespace App\Controller;

use App\Entity\Pilote;
use App\Repository\PiloteRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PiloteController extends AbstractController
{
    /* APP_PILOTE */
    #[Route('/pilote', name: 'app_pilote')]
    public function index(PiloteRepository $piloteRepo): Response
    {
        $pilotes = $piloteRepo->findAll();
        return $this->render('pilote/index.html.twig', [
            'controller_name' => 'PiloteController',
            'pilotes' => $pilotes,
        ]);
    }

    /* SHOW */
    #[Route('/pilote/{id}', name: 'show_pilot', methods: ['GET'])]
    public function show(Request $request, Pilote $pilote , PiloteRepository $piloteRepository): Response
    {
        return $this->render('pilote/show.html.twig', [
            'pilote' => $pilote,
        ]);
    }

    /* EDIT */
    #[Route('/pilote/edit/{id}', name: 'edit_pilot', methods: ['GET', 'POST'])]
    public function edit(Request $request, Pilote $pilote , PiloteRepository $piloteRepository)
    {

    }

    /* ADD */
    #[Route('/pilote/add', name: 'add_pilote', methods: ['GET', 'POST'])]
    public function add(Request $request, PiloteRepository $piloteRepository, Pilote $pilote)
    {
        $pilote = new Pilote();

    }

    /* DELETE */
    #[Route('/pilote/delete/{id}', name: 'delete_pilote', methods: ['GET'])]
    public function delete(Request $request,Pilote $pilote, PiloteRepository $piloteRepository): Response
    {
        $piloteRepository->remove($pilote, true);
        return $this->redirectToRoute('app_pilote');

    }
}
