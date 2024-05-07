/* 페이징 처리 url에 페이지 안나오도록*/
function page(page, action){
    let f = document.createElement('form');

	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'page');
    obj.setAttribute('value', page);

	f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', action);
    document.body.appendChild(f);
    f.submit();
}

function sortPage(action, sort, page){
    let f = document.createElement('form');

	let obj_sort;
    obj_sort = document.createElement('input');
    obj_sort.setAttribute('type', 'hidden');
    obj_sort.setAttribute('name', 'sort');
    obj_sort.setAttribute('value', sort);

	let obj_page;
    obj_page = document.createElement('input');
    obj_page.setAttribute('type', 'hidden');
    obj_page.setAttribute('name', 'page');
    obj_page.setAttribute('value', page);

	f.appendChild(obj_sort);
	f.appendChild(obj_page);
    f.setAttribute('method', 'post');
    f.setAttribute('action', action);
    document.body.appendChild(f);
    f.submit();
}