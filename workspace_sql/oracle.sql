-- 한줄 주석
/* 범위 주석 */
SELECT
    * -- 모든 컬럼
FROM
    emp;

-- sql developer 자동정렬 단축키 : Crtl + F7
SELECT
    empno,
    ename,
    deptno -- 조회하고 싶은 컬럼 명들
FROM
    emp;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    salgrade;
 --distinct : select에서 중복되는 자료를 제거해준다
SELECT
    deptno
FROM
    emp;
 -- 한줄 복사 단축키 : ctrl + shift + d
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job
FROM
    emp; 
 
 -- 컬럼이 여러개인 경우 컬럼들의 조합이 중복되는 걸 제거한다
SELECT DISTINCT
    deptno,
    job
FROM
    emp;
 
 -- null과 연산하면 무조건 null이다
SELECT
    ename,
    sal,
    sal * 12 + comm,
    comm
FROM
    emp;
 -- 컬럼명에 별칭 사용
 -- 별칭 안에 띄어쓰기가 있는 경우 " 생략 불가
 -- 가능하면 띄어쓰기 보단 _를 사용하자
 -- as 생략 가능, "" 생략가능
SELECT
    ename,
    sal,
    sal * 12 + comm AS "new_SAL",
    comm
FROM
    emp;
-- order by : 해당 컬럼으로 정렬
-- 오름차순 : asc 생략가능
-- 내림차순 : desc
SELECT * FROM emp 
ORDER BY sal asc;

SELECT * FROM emp 
ORDER BY comm desc;
-- order by 첫번째거로 정렬하고
-- 그중 같은게 있다면 다음거로 정렬하고
-- 그중 같은게 있다면 다음거로 정렬하고
select * 
from emp
order by deptno asc, sal desc;

SELECT DISTINCT
    JOB
FROM
    EMP
ORDER BY JOB ASC;

select * from emp where deptno = 30;

select * from emp where empno = 7782 ;
select * from emp where sal >= 2000
order by sal;

select * from emp
where ename = 'KING';

select * from emp where deptno = 30 and job='CLERK';

select * from emp where  job='CLERK' and deptno = 30 ;

select * from emp where (deptno = 20 or deptno = 30) and job='CLERK';

select * from emp where sal>=2000 and sal<=3000;

select * from emp
where sal != 3000;
-- where sal <> 3000;
-- where sal ^= 3000;

select * from emp where NOT(sal>=2000 and sal<3000);

select * from emp where job in('MANAGER','SALESMAN','CLERK');

select * from emp
where sal >= 2000 and sal <=3000;

select * from emp
where sal between 2000 and 3000;

select * from emp
where sal not between 2000 and 3000;


-- %는 어떤거든 관계없음
select * from emp
where ename like 'S%';

-- _ 는 딱 한글자 어떤 글자든 상관없음
select * from emp
where ename like 'A%';

select * from emp
where ename like '_L%';

select * from emp
where ename like '%AM%';

select * from emp
where comm <= 400;

select * from emp
where comm is null;

select * from emp
where comm is not null;


-- emp 에서 deptno가 10 또는 20인 사원의
-- empno, ename, sal, deptno를 출력
select empno, ename, sal, deptno
from emp
where deptno in (10,20);
--where deptno=10 or deptno=20;


-- 서로 다른 조회 결과들을 합쳐줌
-- 단 조회한 컬럼의 개수,타입 같아야 한다
select empno, ename, sal, deptno
from emp
where deptno = 10

union

select empno, ename, sal, deptno
from emp
where deptno = 20;


-- union : 중복된 자료를 제거해준다
select empno, ename, sal, deptno
from emp
where deptno = 10
union
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- union all : 중복에 관계없이 합쳐진다
select empno, ename, sal, deptno
from emp
where deptno = 10
union all
select empno, ename, sal, deptno
from emp
where deptno = 10;

-- 여기서부터 문제 --
-- 1번
select * from emp
where ename like '%S';

--2번
select empno, ename,job,sal,deptno from emp
where deptno=30 and job='SALESMAN';

-- 3번
--집합연산자 사용
select empno, ename,job,sal,deptno from emp
where deptno=20 and sal>2000
union all
select empno, ename,job,sal,deptno from emp
where deptno=30 and sal>2000;

-- 집합연산자 사용X
select empno, ename,job,sal,deptno from emp
where deptno=20 and sal>2000;

select empno, ename,job,sal,deptno from emp
where deptno=30 and sal>2000;

--4번
select * from emp
where not(sal>=2000 and sal <= 3000);

--5번
select ename, empno, sal, deptno from emp
where ename like'%E%' 
    and deptno=30 
    and (sal not between 1000 and 2000);
    
--6번
select * from emp
where comm is null
    and (job = 'MANAGER' or job = 'CLERK')
    and (ename not like '_L%');
    
    select ename, upper(ename), lower(ename), initcap(ename)
    from emp;
    
    select * from emp
    where lower(ename) like lower('%Mi%');
    
    select ename, length(ename)
    from emp;
    
    select ename, length(ename)
    from emp
    where length(ename) >=5;
    
-- length : 문자 길이    
-- dual : 임시테이블
select length('한'), lengthb('한') from dual;
    
    
--substr : 대상이 되는문자, 시작위치, 가져올 갯수
select  
        job, 
        substr(job,1,2), substr(job,0,2),
        substr(job,3,2),
        ename,
        substr(job,-3,2),
        substr(job,5,10000)
from emp;

select job, replace(job,'A','*') from emp;

select 
    job, 
    length(job),
    length(job)/2,
    substr(job, (length(job)+1) /2 ,1),
    replace(job,substr(job, (length(job)+1) /2 ,1),'*')
from emp;


-- lpad : 대상이 되는 문자, 전체 자리수, 채울 문자
-- 채울 문자 생략시 공백 문자
select
    job,
    lpad(job,10,'#'),
    lpad(job,4,'#')
from emp;

-- 가운데 정렬 느낌
select
    job,
    rpad(lpad(job,length(job) + ((15-length(job))/2),'*'), ((15-length(job))/2) + length(job),'*')
from emp;


-- 문자열 더하기
select empno || ename || '님'
from emp;


-- trim : 앞 뒤 공백 제거
-- 글씨 사이의 공백은 제거하지 않음
select
    '  a b c           ',
    trim('  a b c           ')
    from dual;

--연습문제 1
select
    '210612-3123456',
    substr('210612-3123456',1,8) || '******' as "substr",
    rpad(substr('210621-3123456',8),length('210621-3123456'),'******') as "100점짜리 정답"
from dual;

--실습문제2
-- 사원의 이름을 앞에 2자리만 보이게 하고 나머지는 *로 표시
-- 정답의 예 : WARD ->> WA**, MARTIN -> MA****
-- 쉬운버전 : 앞 두글자 + '***'

select 
rpad(substr(ename,0,2),length(ename),'*') as "정식버전",
substr(ename,0,2) || '***' as "쉬운버전",
lpad(substr(ename,2,length(ename)),length(ename),'*') as "실습문제3",
substr(ename,1,1) || '*' || substr(ename,2,length(ename)) as "실습문제4",
substr(ename,1,length(ename)/2-0.5) || '*' ||substr(ename,(length(ename)/2+1.5),length(ename)) as "실습문제5"
from emp;

-- 실습문제3
-- 앞글자 하나만
-- WARD -> *ARD, MARTIN -> *ARTIN

-- 실습문제4
-- 두번쨰 글씨만 *
-- WARD -> W*RD, MARTIN -> M*RTIN

-- 실습문제5
-- 가운데 글씨만 *
-- MARTIN > MA*TIN, SCOTT > SC*TT

select 
    trunc(1234.5678),
    trunc(1234.5678,2),
    trunc(1234.5678,-2),
    trunc(-12.34)
from dual;

select
ceil(3.14),
floor(3.14),
ceil(-3.14),
floor(-3.14)
from dual;

-- sysdate : 지금 오라클 pc의 시간 출력
-- 강사 pc는 9시간 차이가 난다(영국 0시 한국 +9시)
-- 날짜 정보 중 일부만 select로 표시됨
select sysdate from dual;

select sysdate, sysdate+1,sysdate-1 from dual;


-- 컬럼에 +를 적으면 모두 숫자로 변경해서 적용
 -- || 숫자도 문자로 적용
 
 select to_char(sysdate+9/24,'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"')
 from dual;
 
 select
 sysdate - to_date('2024-05-07','yyyy-mm-dd')
 from dual;
 
 select
 comm, nvl(comm,-1),
 sal,
 sal + comm,
 sal + nvl(comm,0)
 from emp;
 
 select * from emp
 where comm = 0 or comm is null;
 
 select * from emp
 where nvl(comm,0) = 0;
 
 select
case
when comm is null then 'N/A'
else to_char(comm)
-- '' || comm
end as new_comm
from emp;

select
case
when comm is null then 0
else comm
end
from emp;

-- Q1
select 
empno,
rpad(substr(empno,1,2),length(empno),'*') as MASKIN_EMPNO,
ename,
rpad(substr(ename,1,1),length(ename),'*') as MASKIN_EMPNO
from emp
where length(ename)>=5 and length(ename)<6;

--Q2
select empno,ename,sal,
trunc(sal/21.5,2) as DAY_PAY,
round(sal/21.5/8,1) as TIME_PAY
from emp;
--Q3
select 
empno,
ename,
to_char(hiredate, 'yyyy/mm/dd') as hiredate,
to_char(add_months(hiredate, 3), 'yyyy/mm/dd') as r_job,
case
    when comm is null then 'N/A'
    else to_char(comm)
end as comm
from emp;

--Q4
select empno, ename, mgr,
case
when substr(mgr,1,2) is null then '0000'
when substr(mgr,1,2) ='75' then '5555'
when substr(mgr,1,2) ='76' then '6666'
when substr(mgr,1,2) ='77' then '7777'
when substr(mgr,1,2) ='78' then '8888'
else to_char(mgr)
end as CHG_MGR
from emp;

--Q4_2
select empno, ename, mgr,
case
when mgr is null then '0000'
when mgr like '75%' then '5555'
when mgr like '76%' then '6666'
when mgr like '77%' then '7777'
when mgr like '78%' then '8888'
else ''|| mgr
end as CHG_MGR
from emp;

--Q4_3
select empno, ename, mgr,
case
when lpad(mgr,2) is null then '0000'
when lpad(mgr,2) like '75%' then '5555'
when lpad(mgr,2) like '76%' then '6666'
when lpad(mgr,2) like '77%' then '7777'
when lpad(mgr,2) like '78%' then '8888'
else ''|| mgr
end as CHG_MGR
from emp;

-- count처럼 null은 제외됨
-- count는 *를 많이 씀
select sum(sal), count(sal),count(*),count(comm) from emp;

select count(*) from emp where ename like '%A%';

select max(sal), max(ename),min(hiredate), min(comm),avg(sal)
from emp;

select sum(sal), avg(sal) from emp where deptno=10
union all
select sum(sal), avg(sal) from emp where deptno=20
union all
select sum(sal), avg(sal) from emp where deptno=30;

-- distinct처럼 중복을 제거해줌, 분류해줌
-- select
select deptno, avg(sal),sum(sal),count(*) from emp
group by deptno;

select deptno, empno from emp
group by deptno, empno;

select deptno, job, count(*)
from emp
-- where count(*) >= 2
group by deptno, job
order by deptno, job;

--having : group by 에서만 사용된다
-- 집계함수를 조건으로 걸고 싶을때

select deptno, job, avg(sal)
from emp
group by deptno, job
--    having avg(sal)>=2000;
--    having count(*) >=2
having deptno = 20;

--Q1
select deptno,
floor(avg(sal)) as avg_sal,
max(sal) as max_sal,
min(sal) as min_sal,
count(*) as cnt
from emp
group by deptno;

--Q2
select 
job ,count(*)
from emp
group by job
    having count(job)>=3;
    
select * from dept;

/* 5 */select job,count(*) cnt
/* 1 */from emp
/* 2 */where sal > 1000
/* 3 */group by job
/* 4 */having count (*) >=3
/* 6 */order by cnt desc;

select emp.ename, dept.loc,deptno
from emp, dept
where emp.deptno = dept.deptno
order by empno;
--테이블 두개 이상 조회할때 관계를 꼭 알려줘야 원하는 정보만 출력된다
-- 전체 테이블 수 -1개의 조건이 적당하다

select ename
from emp e, dept d
where e.deptno = d.deptno;

select * 
from emp e, salgrade s
where e.sal >= s.losal and e.sal <=s.hisal;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;

select * from emp;

-- using은 둘 다 같은 컬럼명이 있는 경우만 쓸 수 있다.
select * 
    from emp join dept using (deptno);
    
select * 
from emp join dept on (emp.deptno = dept.deptno);

select * 
from emp e1 join emp e2 on(e1.mgr = e2.empno);


-- left outer join이란? 왼쪽 테이블을 모두 출력하는걸 보장해준다
select * 
from emp e1 right outer join emp e2 on(e1.mgr = e2.empno);

--Quiz1
-- empno, ename, dname, loc 출력 : 결과 14줄
-- where 활용
select e.empno, e.ename, d.dname, d.loc 
from emp e, dept d
where e.deptno = d.deptno;

-- join 활용
select e.empno, e.ename, d.dname, d.loc 
from emp e join dept d using(deptno);

--Quiz2
-- 사번, 이름, 부서명, 급여등급을 출력 : 결과 14줄
-- where 활용
select e.empno, d.dname, e.job, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal >= s.losal and e.sal <=s.hisal;

select e.empno, d.dname, e.job, s.grade
from emp e
left outer join dept d on (e.deptno= d.deptno)
left outer join  salgrade s on(e.sal >= s.losal and e.sal <=s.hisal);


select * from emp;
select * from salgrade;
select * from dept;

    
-- Quiz3
-- 상사 보다 월급이 높은 사원의 이름, 급여, 매니저이름, 매니저 급여
select e1.ename, e1.sal, e2.ename, e2.sal
from emp e1, emp e2
where e1.mgr = e2.empno and e1.sal >= e2.sal;

--Q1
select e.deptno, d.dname,e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and sal>=2000
order by d.deptno;
--Q2
select e.deptno, d.dname, floor(avg(e.sal)) avg_sal, max(e.sal) max_sal, min(e.sal)min_sal,count(e.deptno) cnt
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname;

--Q3
select d.deptno, d.dname, e.empno,e.ename,e.job,e.sal
from emp e right outer join dept d on (e.deptno=d.deptno)
order by deptno, ename;

--Q4


select sal
from emp
where ename = 'JONES';

select * from emp
where sal > (select sal
from emp
where ename = 'JONES');

-- 평균보다 높은 연봉
select * from emp
where sal > (select avg(sal) from emp);

-- BLAKE씨보다  높은 연봉
select * from emp
where sal > (select sal
from emp
where ename = 'BLAKE');

--JONES씨와 같은 와 같은 job을 가지고 있는 사원들
select * from emp
where job = (select job
from emp
where ename = 'JONES');

select * from emp 
where 
sal in(
select max(sal) from emp group by deptno
);