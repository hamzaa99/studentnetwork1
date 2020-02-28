<?php
namespace SocialBundle\Controller;
use SocialBundle\Entity\user;
use SocialBundle\Entity\publication;
use Symfony\Component\HttpFoundation\Request; 
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use \Datetime;

class SocialController extends Controller
{
    //action qui permettera d'inscrire les utilisateurs
    public function accueilAction(Request $request)
    {
        $user = new user;
        $form = $this->createFormBuilder($user)
        ->add('nom', TextType::class)
        ->add('prenom', TextType::class)
        ->add('username', TextType::class)
        ->add('email', EmailType::class)
        ->add('motdepasse', PasswordType::class)
        ->add('date_naissance', DateType::class,[  'years' => range(1900,2005) ])
        ->add('envoyer', SubmitType::class)
        ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
        $entityManager = $this->getDoctrine()->getManager();
        $user->setMotdepasse(password_hash($user->getMotdepasse(), PASSWORD_DEFAULT));
        $entityManager->persist($user);
        $entityManager->flush();
        return $this->redirectToRoute('social_afficher');
        }
        return $this->render('@Social/Default/accueil.html.twig',
        array('monFormulaire' => $form->createView()));
    }
    //action qui permettera d'afficher les utilisateurs
    public function afficherAction()//fonction a retirer
    {
        $repository = $this->getDoctrine()
                           ->getManager()
                           ->getRepository('SocialBundle:user');
        $users = $repository->findall();

 return $this->render('@Social/Default/afficher.html.twig',
 array('users' => $users)); 
    }
    public function afficher2Action()//fonction a retirer
    {
        $repository = $this->getDoctrine()
                           ->getManager()
                           ->getRepository('SocialBundle:user');
        $user = $repository->findOneById($_SESSION["id"]);

 return $this->render('@Social/Default/home.html.twig',
 array('user' => $user)); 
    }
     //action qui permettera de connecter les utilisateurs
    public function connexionAction(Request $request)
    {
        $user = new user;
        $form = $this->createFormBuilder($user)
        ->add('username', TextType::class)
        ->add('motdepasse', PasswordType::class)
        ->add('se connecter', SubmitType::class)
        ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted())
         {
            $entityManager = $this->getDoctrine()->getManager();
            $repository = $entityManager ->getRepository('SocialBundle:user');
            $user1 = $repository->findOneByusername($user->getUsername());
            if ($user1 != null) 
                {
                    if (password_verify($user->getMotdepasse(),$user1->getMotdepasse()))
                    {
                
                        $_SESSION["id"]=$user1->getId();
                        return $this->redirectToRoute('social_afficher2');

                    }
                }
                
        }
        return $this->render('@Social/Default/connexion.html.twig',
                array('monFormulaire' => $form->createView())); 
    }
    public function deconnexionAction(Request $request)
    {
        unset($_SESSION["id"]);
        return $this->redirectToRoute('social_accueil');
    }
    public function publierAction(Request $request)
    {
        $publication = new publication;
        $form = $this->createFormBuilder($publication)
        ->add('titre', TextType::class)
        ->add('contenu', TextareaType::class)
        ->add('envoyer', SubmitType::class)
        ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
        $entityManager = $this->getDoctrine()->getManager();
        $repository=$entityManager->getRepository('SocialBundle:user');
        $user = $repository->findOneById($_SESSION["id"]);
        $publication->setUser($user);
        $publication->setDate(new Datetime());
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($publication);
        $entityManager->flush();
        return $this->redirectToRoute('social_afficher2');
        }
        return $this->render('@Social/Default/publier.html.twig',
        array('monFormulaire' => $form->createView()));
    }
    public function chercheruserAction(Request $request)
    {
        $publication = new publication;
        $form = $this->createFormBuilder($publication)
        ->add('titre', TextType::class)
        ->add('contenu', TextareaType::class)
        ->add('envoyer', SubmitType::class)
        ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
        $entityManager = $this->getDoctrine()->getManager();
        $repository=$entityManager->getRepository('SocialBundle:user');
        $user = $repository->findOneById($_SESSION["id"]);
        $publication->setUser($user);
        $publication->setDate(new Datetime());
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($publication);
        $entityManager->flush();
        return $this->redirectToRoute('social_afficher2');
        }
        return $this->render('@Social/Default/publier.html.twig',
        array('monFormulaire' => $form->createView()));
    }
    
     
}
