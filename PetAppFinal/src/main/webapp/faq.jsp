<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="faq.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>FAQ</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #f5f4f2;">
	<%@include file="all_component/navbar.jsp"%>
	<hr>

	<div class="faq-container p-2">
		<div class="faq">
			<h3 class="faq-title">De ce sa adopti un animal?</h3>
			<p class="faq-text">Adoptarea unui animal oferă acestuia o a doua
				șansă la o viață fericită și iubitoare. Când adopți un animal
				dintr-un adăpost, salvezi o viață și eliberezi un loc pentru alt
				animal care are nevoie de ajutor. Animalele din adăposturi sunt
				adesea socializate și pregătite să se integreze în noua lor casă,
				iar adopția contribuie la reducerea suprapopulării animalelor fără
				stăpân. În plus, adoptarea este de obicei mai accesibilă financiar
				decât cumpărarea unui animal de la un crescător.</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>

		<div class="faq">
			<h3 class="faq-title">Care sunt factorii de luat in considerare
				atunci cand adopt?</h3>
			<p class="faq-text">Când te gândești să adopți un animal, este
				important să iei în considerare mai mulți factori pentru a te
				asigura că vei putea oferi un mediu potrivit și iubitor pentru noul
				tău prieten. Asigură-te că stilul tău de viață și spațiul disponibil
				sunt compatibile cu nevoile animalului pe care vrei să-l adopți.
				Gândește-te la timpul pe care îl poți aloca pentru hrănire, dresaj
				și exerciții, precum și la costurile implicate pentru îngrijirea
				acestuia. De asemenea, este important ca toți membrii familiei să
				fie de acord cu adopția și să fie pregătiți să contribuie la
				îngrijirea noului membru. Informează-te despre comportamentul și
				nevoile animalului pentru a te asigura că este potrivit pentru tine
				și fii conștient de responsabilitatea pe termen lung pe care o
				implică adopția.</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>

		<div class="faq">
			<h3 class="faq-title">Ce tipuri de animale pot gasi pe site?</h3>
			<p class="faq-text">Pe site-ul nostru, poți găsi o varietate de
				animale de companie, în special câini și pisici, care așteaptă să-și
				găsească o casă iubitoare. Câinii disponibili pentru adopție variază
				de la rase mici și jucăușe, perfecte pentru apartamente, până la
				rase mari și active, ideale pentru familiile care au curți spațioase
				și timp pentru plimbări zilnice. Pisicile de pe site includ atât
				rase pure, cât și metiși adorabili, fiecare cu personalități unice,
				de la pisici foarte jucăușe și sociabile, la cele mai liniștite și
				independente. Indiferent de preferințele tale, vei găsi cu siguranță
				un prieten loial și iubitor care să se potrivească stilului tău de
				viață</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>

		<div class="faq">
			<h3 class="faq-title">Cum pot să adaug un anunț de adopție?</h3>
			<p class="faq-text">În primul rand pentru a adauga un anunț de
				adopție trebuie sa iti creezi cont și să fi autentificat, pe partea
				de jos a paginii pentru fiecare categorie „Adoptă”, „Pierdute”,
				„Găsite”, va apărea un icon + care face posibila adaugarea unui
				anunt</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>

		<div class="faq">
			<h3 class="faq-title">Cum decurge procesul de adopție</h3>
			<p class="faq-text">Dupa ce ai adaugat un animal in wishlist prin
				butonul adauga poti aplica prin oferirea unei descrieri. Este
				indicat ca in descriere sa te legi de stilul tau de viata si
				potrivirea acestuia cu a animalului respectiv. Stapanul va analiza
				cererea ta iar in cazul in care va fi aporbata vei primi o
				notificare email.</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>

		<div class="faq">
			<h3 class="faq-title">Cum procedez dacă mi-am schimbat adresa?</h3>
			<p class="faq-text">Din sectiunea editare profil</p>

			<button class="faq-toggle">
				<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>

			</button>
		</div>
	</div>

	<script src="faq.js"></script>
</body>
</html>