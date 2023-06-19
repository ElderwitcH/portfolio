let animItems = document.querySelectorAll('._anim-items');//Получаем объекты, которые нужно анимировать

let anchors = document.querySelectorAll("a[href*='#']");

for (let anchor of anchors) {
	anchor.addEventListener("click", (e) => {
		e.preventDefault();
		const blocId = anchor.getAttribute("href");
		document.querySelector("" + blocId).scrollIntoView({
			behavior: "smooth",
			block: "start"
		});
	})

}


if (animItems.length > 0) {//Проверяем на то что элементы есть
	window.addEventListener('scroll', animOnScroll)//Добавляем на скролл окна функцию
	function animOnScroll() {
		for (let index = 0; index < animItems.length; index++) {//Проходимся по каждому элементу анимации
			const animItem = animItems[index];//Присваиваем отдельный элемент в отдельную переменную
			const animItemHeight = animItem.offsetHeight;//Присваиваем переменной высоту элемента страницы
			const animItemOffset = offset(animItem).top;//Обрабатываем функцией элемент и находим на то сколько сверху нужно отступить
			const animStart = 4;

			let animItemPoint = window.innerHeight - animItemHeight / animStart;

			if (animItemHeight > window.innerHeight) {
				animItemPoint = window.innerHeight - window.innerHeight / animStart;
			}

			if ((pageYOffset > animItemOffset - animItemPoint) && pageYOffset < (animItemOffset + animItemHeight)) {
				animItem.classList.add('_active');
			}
			else {
				if (!animItem.classList.contains('_anim-no-hide')) {
					animItem.classList.remove('_active');
				}
			}

		}
	}
	function offset(el) {
		const rect = el.getBoundingClientRect(),
			scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
			scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		return { top: rect.top + scrollTop, left: rect.left + scrollLeft }

	}
	setTimeout(() => {
		animOnScroll();
	}, 3000);

}