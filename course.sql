
DROP TABLE IF EXISTS administrator;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS participant;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS course;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS forum;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS book;
DROP SEQUENCE IF EXISTS id;


CREATE TABLE participant
(
    id SERIAL PRIMARY KEY,
    registrationDate DATE NOT NULL,
    fullName CHAR(50) NOT NULL,
    publickName CHAR(20) NOT NULL,
    position CHAR(30) NOT NULL,
    password CHAR(20) NOT NULL,
    login CHAR(20) NOT NULL,
    education CHAR(40) NOT NULL,
    status CHAR(30) NOT NULL
);

CREATE TABLE administrator
(
    id SERIAL PRIMARY KEY,
    --id_part INT FOREIGN KEY(id) REFERENCES participant(id),
    license CHAR(40)
) INHERITS (participant);

CREATE TABLE learningResourses
(
    id SERIAL PRIMARY KEY,
    title CHAR(40) NOT NULL,
    description CHAR(2000),
    status CHAR(20) NOT NULL,
    accessRight CHAR(30) NOT NULL,
    theme CHAR(500)
);

CREATE TABLE course
(
    id SERIAL PRIMARY KEY,
    --id_resourses INT FOREIGN KEY(id) REFERENCES learningResourses(id),
    beginDate DATE NOT NULL,
    endDate DATE NOT NULL,
    teacher CHAR(50) NOT NULL
) INHERITS (learningResourses);

CREATE TABLE forum
(
    id SERIAL PRIMARY KEY,
    --id_resourses INT FOREIGN KEY(id) REFERENCES learningResourses(id),
    publickationDate DATE NOT NULL,
    autor CHAR(50) NOT  NULL
);

CREATE TABLE book
(
    id SERIAL PRIMARY KEY,
    --id_resourses INT FOREIGN KEY(id) REFERENCES learningResourses(id),
    id_resourses FOREIGN KEY(id) REFERENCES participant(id),
    issueYear INT NOT NULL,
    author CHAR(50) NOT NULL
) INHERITS (learningResourses);


INSERT INTO learningResourses (title,
                                description,
                                status,
                                accessRightL,
                                theme)
VALUES ('2020-01-13', 
        'Aleksandr-HH', 
        'allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.
А кто как относится к жареной картошке и кто как ее готовит
ведь у каждого наверняка есть секреты
поделитесь.',
        'forum', 
        'О разном'
        );

INSERT INTO forum (publickationDate,
                   autor,
                   title,
                   theme,
                   content,
                   status)
VALUES ('2020-01-10', 
        'McLarenPlay', 
        'kiberforum',
        'Ошибка при работе с GetCurrencyFormat', 
        'Здравствуйте. Есть следующая проблема. Мне надо просто вывести число в заданном мной денежном формате с помощью GetCurrencyFormat, однако при компиляции возникает следующая ошибка:

Вызвано исключение по адресу 0x76C2FF90 (KernelBase.dll) в OSO.exe: 0xC0000005: нарушение прав доступа при чтении по адресу 0x0000002C.',
        'forum');


'''
INSERT INTO administrator (registrationDate, 
                          fullName, 
                          publickName, 
                          position, 
                          password, 
                          login) 
VALUES ('2020-01-10', 'Бектимиров Р.З.', 'admin1', 'графический дизайнер', 'Qwerty132', 'oneadmin');

INSERT INTO administrator (registrationDate, 
                          fullName, 
                          publickName, 
                          position, 
                          password, 
                          login) 
VALUES ('2020-01-10', 'Шаргородский В.А.', 'admin2', 'технический администратор', 'Waldemarka', 'twoadminer');

INSERT INTO administrator (registrationDate, 
                          fullName, 
                          publickName, 
                          position, 
                          password, 
                          login) 
VALUES ('2020-01-10', 'Гараба Я.В.', 'admin3', 'пользовательский администратор', '1357986420', 'freead');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-10-29', 'Калыш К.С.', 'knyaz', 'стандартный пользователь', '123456', 'password1', 'ONPU', 'course, forum');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status)  
VALUES ('2020-01-11', 'Мудрик В.С.', 'anonym', 'привилегированный пользователь', '228288', 'passwordhard', 'ONPU', 'course, forum, book');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-09-10', 'Волков С.В.', 'bradowskiy', 'стандартный пользователь', '325467', 'easypass', 'ONPU', 'course');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-10-10', 'Подолян Е.И.', 'podolyan', 'стандартный пользователь', '202020', 'veryhardpass', 'ONPU', 'forum');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-12-10', 'Вознюк Д.В.', 'steelsight', 'стандартный пользователь', '0982929', 'steelpass', 'ONPU', 'book');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-06-10', 'Платоненко С.А.', 'numibis', 'стандартный пользователь', '098765', 'somepeople', 'ONPU', 'book, forum');

INSERT INTO participant (registrationDate, 
                        fullName, 
                        publickName, 
                        position, 
                        password, 
                        login,
                        education,
                        status) 
VALUES ('2020-07-10', 'Красношлык А.В.', 'akras', 'стандартный пользователь', '45645676', 'musikmylife', 'OUA', 'book, forum');

INSERT INTO book (title,
                  description,
                  status,
                  accessRight,
                  theme,
                  issueYear,
                  author)
VALUES ('Самый богатый человек в Вавилоне', 
        'Книга «Самый богатый человек в Вавилоне» Джоржа Сэмюэля Клейсона — интересная и полезная работа в сфере экономики и управления финансами. Произведение впервые вышло в 1926 году и быстро стало популярным среди банковских работников и сотрудников страховых компаний. Пережив множество переизданий, сегодня оно считается классикой экономической литературы',
        'book', 
        'book', 
        'Книга построена в форме сборника древних притч, с помощью них автор пытается донести до читателя идеи, принципы и методы, с помощью которых люди достигают поставленных целей и богатства вот уже на протяжении более 1000 лет',
        '2015', 
        'Джорж Сэмюэль Клейсон');

INSERT INTO book (title,
                  description,
                  status,
                  accessRight,
                  theme,
                  issueYear,
                  author)
VALUES ('Этюд в багровых тонах', 
        'Военный врач Джон Ватсон ищет недорогое жилье. Его соседом по квартире оказывается загадочный Шерлок Холмс — «сыщик-консультант», способный раскрыть самые запутанные преступления. В это же время череда таинственных убийств, следующих друг за другом, ставит в тупик лондонскую полицию. С этого момента начинаются детективные приключения, без которых не мыслят своей жизни уже несколько поколений любителей этого жанра',
        'book', 
        'book', 
        'Красным по белому / Красное по белому / Мормоны в Лондоне / Поздняя месть / Кровавый этюд / Месть (Из воспоминаний доктора Уатсона) / Надпись кровью / Багровый след',
        '1887', 
        'Артур Конан Дойл');

INSERT INTO book (title,
                  description,
                  status,
                  accessRight,
                  theme,
                  issueYear,
                  author)
VALUES ('Этюд в багровых тонах', 
        'Глубокий, неоднозначный, сложный и духовно сильный роман о Боге, свободе и морали, универсальная энциклопедия мечущейся человеческой души.

Три брата, Иван, Алеша и Митя, заняты разрешением вопросов о первопричинах и конечных целях бытия. Их отец – прожига Федор Павлович Карамазов. Митя – ребенок от первого брака с богатой женщиной Аделаидой Ивановной Миусовой, оставившей Федору после смерти состояние и малолетнего сына, о котором отец, предаваясь оргиям и спекуляциям, позабыл. Женившись вторично на красивой сироте Софье Ивановне, Федор не исправился и, издеваясь над ней из-за отсутствия преданного, продолжил распутную жизнь. В конце концов он свел свою вторую жену, родившую ему двоих сыновей, в могилу. Дети же были отданы опекунам.

История одной семьи - призма, сквозь которую преломляется социально-философская эпопея о прошлом, настоящем и будущем России.',
        'book', 
        'book', 
        'Лгущий себе самому прежде всех и обидеться может. Ведь обидеться иногда очень приятно, не так ли? И ведь знает человек, что никто не обидел его, а что он сам себе обиду навыдумал и налгал для красы, сам преувеличил, чтобы картину создать, к слову привязался <…> – знает сам это, а всё-таки самый первый обижается, обижается до приятности.',
        '1879', 
        ' Федор Михайлович Достоевский');

INSERT INTO book (title,
                  description,
                  status,
                  accessRight,
                  theme,
                  issueYear,
                  author)
VALUES ('Перстень Борджия', 
        'Мастер детективной интриги, король неожиданных сюжетных поворотов, потрясающий знаток человеческих душ, эксперт самых хитроумных полицейских уловок и даже… тонкий ценитель экзотической кухни. Пожалуй, набора этих достоинств с лихвой хватило бы на добрыйдесяток авторов детективных историй. Но самое поразительное заключается в том, что все эти качества характеризуют одного замечательного писателя. Первые же страницы знаменитого романа «Перстень Борджа» послужат пропуском в мир, полный невероятных приключений и страшных тайн, – мир книг Джеймса Хедли Чейза, в котором никому еще не было скучно.',
        'book', 
        'book', 
        'Книга, изобилующая роскошными женщинами и героями-мужчинами, все как и обещает обложка: крутой детектив. Один богатый человек поручил другому богатому человеку украсть у третьего богатого человека старинный перстень, который тот украл у четвертого богатого человека. Нанимается команда профессионалов - каждый из них профи в своём деле, но вместе они совсем не команда.',
        '1992', 
        'Джеймс Хеддли Чейз');

INSERT INTO course (title,
                    description,
                    status,
                    accessRight,
                    beginDate,
                    endDate,
                    theme,
                    teacher)
VALUES ('Python (продвинутый курс)', 
        'Если представить языки программирования людьми, то Python будет безумным гением-мечтателем среди строгих профессоров. На нем хорошо пишется практически все, он отлично чувствует себя в вебе и почти незаменим в современных отраслях IT. Помимо десктопного ПО и сайтов, его используют в программировании контроллеров, смарт технологий и Data Science, где он по праву лучший. Простой в изучении, мощный и удобный в использовании — все это про Python. ',
        'course', 
        'course', 
        '2020-10-01',
        '2020-11-01',
        'Комплексная программа обучения языку программирования Рython. Рython ориентирован на повышение продуктивности фронтенда и читабельности его кода. Язык прост в использовании, но в то же время его библиотека насчитывает большой выбор полезных функций, необходимых для создания веб-дизайна.',
        'Панькина Анна Сергеевна');

INSERT INTO course (title,
                    description,
                    status,
                    accessRight,
                    beginDate,
                    endDate,
                    theme,
                    teacher)
VALUES ('Курс менеджмента', 
        'Курс рассматривает искусство управления проектами. Он подойдет тем, кто хочет сделать карьеру в IT или создать свой технологический проект.',
        'course', 
        'course', 
        '2020-10-01',
        '2020-11-15',
        'В программе курса: какие есть виды проектов, как оценивать риски, работать с клиентами и командой.

    Научиться выбирать и адаптировать методологию разработки под нужды проекта
    Научиться формировать и развивать команду для удовлетворения целей проекта
    Научиться определять критерии измерения производительности проекта и оценивать их
    Научиться выявлять и оценивать риски проекта, а также формировать стратегии по работе с рисками',
        'Блажко Олександ Анатольевич');

INSERT INTO course (title,
                    description,
                    status,
                    accessRight,
                    beginDate,
                    endDate,
                    theme,
                    teacher)
VALUES ('Курс ораторского исскуства', 
        'Школа ораторского искусства в Одессе, это про легкость в общении, про уверенность перед аудиторией, артистизм, навыки убеждения, про сочную образную речь. Предлагая классическую риторику в реалиях современности, мы превращаем речь наших студентов в инструмент, а их самих – в виртуозов этого инструмента.',
        'course', 
        'course', 
        '2020-10-01',
        '2020-11-01',
        'По речи судят о способностях человека, перспективе и его возможностях вести дела. Искусство общения и владение словом – это искусство жить. Хорошая речь – ключ к самореализации и успешности в любой сфере',
        'Галчёнков Олег Николаевич');

INSERT INTO forum (publickationDate,
                   autor,
                   title,
                   theme,
                   content,
                   status)
VALUES ('2020-01-10', 
        'McLarenPlay', 
        'kiberforum',
        'Ошибка при работе с GetCurrencyFormat', 
        'Здравствуйте. Есть следующая проблема. Мне надо просто вывести число в заданном мной денежном формате с помощью GetCurrencyFormat, однако при компиляции возникает следующая ошибка:

Вызвано исключение по адресу 0x76C2FF90 (KernelBase.dll) в OSO.exe: 0xC0000005: нарушение прав доступа при чтении по адресу 0x0000002C.',
        'forum');

INSERT INTO forum (publickationDate,
                   autor,
                   title,
                   theme,
                   content,
                   status)
VALUES ('2020-01-13', 
        'Aleksandr-HH', 
        'allforum',
        'О разном', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.
А кто как относится к жареной картошке и кто как ее готовит
ведь у каждого наверняка есть секреты
поделитесь.',
        'forum');

INSERT INTO forum (publickationDate,
                   autor,
                   title,
                   theme,
                   content,
                   status)
VALUES ('2020-01-14', 
        'Richard', 
        'forumOdd',
        'Где в Одессе кино снимали ', 
        'А давайте вспомним места в городе, кот-е засветились в старых фильмах? Интересно сравнить то, что было тогда и что стало теперь. Вот для затравки что вспомнил:
1. Приключения Электроника
- Гусев гонялся за Сыроежкиным между столбами стекляшки на Куликовом поле;
- а бегал по лестнице за ним в Дворце культуры студентов на Шевченко,1
- съемки в парке Ленина, как раз на выставке цветов
- хоккейный матч во Дворце спорта
- школу сыроежкина идентифицировать не удалось - чет слишком круто для школы - похоже это какой-то институт, но не политех точно
2. Приключение Петрова и Васечкина
- на скейтах они катались по улице Крупской, вдоль забора 411-го госпиталя
- в кино на Белое солнце пустыни ходили в Вымпел, на Патриса лумумбы
- школу их тоже обнаружить не удалось - вроде где-то на Таирова
3. Место встречи изменить нельзя
- эпизод где жеглов обыгрывал куравлева снимали в парке шевченко, в бильярдной возле входа
4. Зеленый фургон (старый, еще черно белый)',
        'forum');
		
		INSERT INTO learningResourses (title,
                                description,
                                status,
                                accessRight,
                                theme)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария');

INSERT INTO forum (publickationDate, autor)
VALUES ('2020-01-13', 'Aleksandr-HH');
    
SELECT * FROM learningResourses
INSERT INTO learningResourses (title,
                                description,
                                status,
                                accessRight,
                                theme)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария');

INSERT INTO forum (publickationDate, autor)
VALUES (SELECT * FROM learningResourses WHERE '2020-01-13', 'Aleksandr-HH');
    
SELECT * FROM learningResourses
DROP TABLE IF EXISTS administrator;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS participant;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS course;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS forum;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS book;
DROP SEQUENCE IF EXISTS id;
DROP TABLE IF EXISTS learningResourses;
DROP SEQUENCE IF EXISTS id;


CREATE TABLE participant
(
    id SERIAL PRIMARY KEY,
    registrationDate DATE NOT NULL,
    fullName CHAR(50) NOT NULL,
    publickName CHAR(20) NOT NULL,
    position CHAR(30) NOT NULL,
    password CHAR(20) NOT NULL,
    login CHAR(20) NOT NULL,
    education CHAR(40) NOT NULL,
    status CHAR(30) NOT NULL
);

CREATE TABLE administrator
(
    id SERIAL PRIMARY KEY,
    id_part INT REFERENCES participant(id),
    license CHAR(40)
) INHERITS (participant);

CREATE TABLE learningResourses
(
    id SERIAL PRIMARY KEY,
    title CHAR(40) NOT NULL,
    description CHAR(2000),
    status CHAR(20) NOT NULL,
    accessRight CHAR(30) NOT NULL,
    theme CHAR(500)
);

CREATE TABLE course
(
    id SERIAL PRIMARY KEY,
    id_resourses INT REFERENCES learningResourses(id),
    beginDate DATE NOT NULL,
    endDate DATE NOT NULL,
    teacher CHAR(50) NOT NULL
) INHERITS (learningResourses);

CREATE TABLE forum
(
    id SERIAL PRIMARY KEY,
    id_resourses INT REFERENCES learningResourses(id),
    publickationDate DATE NOT NULL,
    autor CHAR(50) NOT  NULL
) INHERITS (learningResourses);

CREATE TABLE book
(
    id SERIAL PRIMARY KEY,
    id_resourses INT REFERENCES learningResourses(id),
    issueYear INT NOT NULL,
    author CHAR(50) NOT NULL
) INHERITS (learningResourses);
INSERT INTO learningResourses (title,
                                description,
                                status,
                                accessRight,
                                theme)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария');

INSERT INTO forum (title,
                   description,
                   status,
                   accessRight,
                   theme,
           publickationDate, 
           autor)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария',
    '2020-01-13', 
    'Aleksandr-HH');
    
SELECT * FROM forum
/*INSERT INTO learningResourses (title,
                                description,
                                status,
                                accessRight,
                                theme)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария');
*/
INSERT INTO forum (title,
            description,
            status,
            accessRight,
            theme,
             publickationDate, 
            autor)
VALUES ('allforum', 
        'Если вы не любите жареную картошку, значит вы просто не умеете ее готовить. В общаге было любимым блюдом, последний раз сам картошку жарил лет 10-12 назад, а сейчас невыдержал,
пошел порезал мелко лук, обжарил его до золотистой корочки, высыпал сверху нарезанную соломкой картошку, сразу помешал, и готовил на сильном огне с открытой крышкой. Оказалось навык я не потерял. Достал горлодер, сало копченое, соленый огручик и поужинал.
Трудный день был, только смог поесть первый раз за день просто.',
        'forum', 
        'бессплатно',
        'кулинария',
    '2020-01-13', 
    'Aleksandr-HH');
    
        
SELECT * FROM administrator;
SELECT * FROM participant;
SELECT * FROM course;
SELECT * FROM book;
SELECT * FROM forum;
'''