<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="lt" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="wg" tagdir="/WEB-INF/tags/widget" %>
<%@taglib prefix="ce" tagdir="/WEB-INF/tags/application/updates/react-v16.x-road-map" %>
<%@taglib prefix="app" tagdir="/WEB-INF/tags/application" %>

<c:url var="versioningUrl" value="https://reactjs.org/docs/faq-versioning.html"/>
<%--todo--%>
<c:url var="codeSplittingUrl" value="https://reactjs.org/docs/code-splitting.html#reactlazy"/>
<c:url var="codeSplitting2Url" value="https://hackernoon.com/lazy-loading-and-preloading-components-in-react-16-6-804de091c82d"/>

<%--todo--%>
<c:url var="hookIntroUrl" value="https://reactjs.org/docs/hooks-intro.html"/>
<%--todo--%>
<c:url var="hookOverviewUrl" value="https://reactjs.org/docs/hooks-overview.html"/>
<c:url var="hookTalksUrl" value="https://www.youtube.com/watch?v=V-QO-KO90iQ"/>
<%--todo--%>
<c:url var="hookFAQUrl" value="https://reactjs.org/docs/hooks-faq.html"/>
<c:url var="makingSenseOfReactHooksUrl" value="https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889"/>
<c:url var="hookIssueCommentUrl" value="https://github.com/reactjs/rfcs/pull/68#issuecomment-439314884"/>
<c:url var="hookIssueComment2Url" value="https://github.com/reactjs/rfcs/pull/68#issuecomment-439314884"/>
<c:url var="hooksInRNUrl" value="https://github.com/facebook/react-native/issues/21967"/>
<c:url var="hooksAdoptionStrategyUrl" value="https://reactjs.org/docs/hooks-faq.html#adoption-strategy"/>
<c:url var="andrewTalksUrl" value="https://www.youtube.com/watch?v=ByBPyMBTzM0"/>
<c:url var="suspenseTalksUrl" value="https://www.youtube.com/watch?v=ByBPyMBTzM0&feature=youtu.be&t=1312"/>
<c:url var="suspenseDemoUrl" value="https://github.com/facebook/react/tree/master/fixtures/unstable-async/suspense"/>
<c:url var="reactCacheUrl" value="https://github.com/facebook/react/blob/master/packages/react-cache/src/ReactCache.js"/>
<c:url var="issue14248Url" value="https://github.com/facebook/react/issues/14248"/>
<c:url var="issue135258Url" value="https://github.com/facebook/react/issues/13525"/>
<c:url var="talksServerRendererUrl" value="https://www.youtube.com/watch?v=z-6JC0_cOns"/>
<c:url var="serverRendererGitUrl" value="https://github.com/facebook/react/pulls?utf8=%E2%9C%93&q=is%3Apr+is%3Aopen+fizz"/>
<c:url var="rfcsUrl" value="https://github.com/reactjs/rfcs"/>
<c:url var="issuesUrl" value="https://github.com/facebook/react/issues"/>
<c:url var="twitterUrl" value="https://mobile.twitter.com/reactjs"/>

<a name="pageStart"></a>
<div class="black-line"></div>
<div class="page react-v16.x-road-map">
    <h1>React v16.x: план дествий</h1>

    <wg:p><b>Ноябрь 27, 2018 Дэн Абрамов</b></wg:p>

    <br/>

    <p class="introduction">
        Возможно, вы слышали о таких функциях, как «Hooks», «Suspense» и «Concurrent Rendering» в предыдущих постах и обсуждениях.
        В этом посте мы рассмотрим, как они сочетаются друг с другом, и ожидаемые сроки их доступности в стабильной версии React.
    </p>

    <br/>
    <br/>
    <div class="gray-line"></div>

    <h2>tl;dr</h2>

    <br/>

    <p>Мы планируем разделить развертывание новых функций React на следующие этапы:</p>

    <ul>
        <li>
            <p>React 16.6 с функцией <b>Suspense</b> (приостановка) для разбиения кода (<i>уже поставлен</i>)</p>
        </li>
        <li>
            <p>Минорный релиз 16.x с функцией <b>Hooks</b> (~первый квартал 2019)</p>
        </li>
        <li>
            <p>Минорный релиз 16.x с функцией <b>Concurrent Mode</b> (~второй квартал 2019)</p>
        </li>
        <li>
            <p>Минорный релиз 16.x с функцией <b>Suspense</b> для извлечения данных (Data Fetching) (~середина 2019)</p>
        </li>
    </ul>

    <br/>

    <p><i>(В оригинальной версии данного поста использовались точные номера версий. Мы отредактировали его, чтобы отразить, что
        между этими версиями может потребоваться несколько других промежуточных релизов.)</i></p>

    <br/>

    <p>Это приблизительные оценки, и детали могут измениться по мере нашего продвижения вперед.
        Есть еще как минимум два проекта, которые мы планируем завершить в 2019 году. Они требуют
        дополнительного изучения и еще не привязаны к конкретному релизу:</p>

    <ul>
        <li>
            <p>
                <b><a href="#modReactDOM">Модернизация React DOM</a></b>
            </p>
        </li>
        <li>
            <p>
                <b><a href="#suspenseForServerRendering">Suspense для серверной отрисовки</a></b>
            </p>
        </li>
    </ul>

    <br/>

    <p>Мы ожидаем, что их график прояснится в ближайшие месяцы.</p>

    <br/>

    <app:alert type="warning" title="Внимание!">
        Данный пост - просто план действий - в нем нет ничего, что потребовало бы вашего неотложного внимания.
        Когда каждая из данных функций будет выпущена, мы опубликуем об этом полный исчерпывающий пост.
    </app:alert>

    <br/>
    <br/>
    <div class="gray-line"></div>

    <h2>График релизов</h2>

    <br/>

    <p>У нас есть единое видение того, как все эти функции сочетаются друг с другом, но мы будем
        выпускать каждую часть, как только она будет готова, чтобы вы могли ее испытать и начать
        использовать. Дизайн API не всегда очевиден, если рассматривать каждую часть по отдельности.
        В этом посте изложены главные части нашего плана, чтобы помочь вам увидеть всю картину.
        (см. нашу <b><a href="${versioningUrl}">политику управления версиями</a></b>, чтобы узнать больше о нашей приверженности стабильности.)</p>

    <p>Стратегия последовательных релизов помогает нам усовершенствовать API, но переходный период,
        когда некоторые вещи не готовы, может сбить с толку. Давайте посмотрим, что эти различные
        функции означают для вашего приложения, как они связаны друг с другом, и когда вы можете
        начать изучать и использовать их.</p>

    <br/>

    <h3>React 16.6 (поставлен): обладает функцией приостановки для разбиения кода</h3>

    <br/>

    <p>Под <b>приостановкой</b> понимается новая способность React «приостанавливать» отрисовку,
        когда компоненты чего-то ждут, и отображать индикатор загрузки. В React 16.6 приостановка
        поддерживает только один вариант использования: отложенная загрузка компонентов с
        помощью <code>React.lazy()</code> и <code>&lt;React.Suspense&gt;</code>.</p>

    <ce:code-example-1/>

    <br/>

    <p>Разбиение кода с помощью <code>React.lazy()</code> и <code>&lt;React.Suspense&gt;</code> описано в <b><a href="${codeSplittingUrl}">руководстве по
            разбиению кода</a></b>. Однако Вы можете найти и другое практическое объяснение в
        <b><a href="${codeSplitting2Url}">этой статье</a></b>.</p>

    <p>Мы используем приостановку для разбиения кода в Facebook с июля и ожидаем, что она будет стабильной.
        В первоначальном публичном релизе в 16.6.0 было несколько регрессий, но они были исправлены в версии 16.6.3.</p>

    <p>Разбиение кода - это только первый шаг для функции приостановки. Наше долгосрочное видение этой функции
        включает в себя возможность обработки извлечения данных (и интеграции с такими библиотеками, как Apollo).
        В дополнение к удобной модели программирования концепция приостановки также обеспечивает лучшее взаимодействие с
        пользователем в параллельном режиме. Вы найдете информацию по этим темам ниже.</p>

    <br/>

    <p><b>Статус в React DOM</b>: доступна с React 16.6.0.</p>

    <br/>

    <p><b>Статус в React DOM Server</b>: приостановка еще не доступна в серверной отрисовке. Это не связано с
        недостатком внимания к данной функции. Мы начали работу над новым асинхронным движком серверной отрисовки,
        который будет поддерживать приостановку, но это большой проект, и его завершение займет 2019 год.</p>

    <br/>

    <p><b>Статус в React Native</b>: Разделение бандлов не очень полезно в React Native, но технически ничто
        не мешает <code>React.lazy()</code> и <code>&lt;Suspense&gt;</code> работать при получении Promise для модуля.</p>

    <br/>

    <p><b>Рекомендация:</b> Если вы выполняете только клиентскую отрисовку, мы рекомендуем широко
        применять <code>React.lazy()</code> и <code>&lt;React.Suspense&gt;</code> для разбиения кода. Если вы выполняете серверную отрисовку,
            вам придется подождать с использованием, пока новый движок серверной отрисовки не будет готов.</p>

    <br/>

    <h3>React 16.x (~первый квартал 2019): добавление функции Hooks</h3>

    <br/>

    <p><b>Хуки</b> позволяют использовать такие функции, как состояние и жизненный цикл компонентов-функций.
        Они также позволяют вам повторно использовать логику с отслеживанием состояния между компонентами,
        не вводя дополнительную вложенность в ваше дерево.</p>

    <ce:code-example-2/>

    <br/>

    <p><b><a href="${hookIntroUrl}">Введение</a></b> и <b><a href="${hookOverviewUrl}">обзор</a></b> хуков - хорошие источники для начала изучения. Посмотрите данные
        <b><a href="${hookTalksUrl}">доклады</a></b> для ознакомления и глубокого погружения. <b><a href="${hookFAQUrl}">FAQ</a></b> должен ответить на большинство ваших
        дальнейших вопросов. Чтобы узнать больше о мотивах хуков, вы можете прочитать данную статью<b><a href="${makingSenseOfReactHooksUrl}"></a></b>.
        Обоснование дизайна API для хуков объясняется <b><a href="${hookIssueCommentUrl}">в данном ответе в RFC ветке</a></b>.</p>

    <p>Мы работаем с хуками в Facebook с сентября и не ожидаем серьезных ошибок в реализации.
        Хуки доступны только в 16.7 альфа-версиях React. Ожидается, что некоторые из их API будут изменены в
        окончательной версии (подробности см. в конце <b><a href="${hookIssueComment2Url}">этого комментария</a></b>). Возможно, что minor
        версия с хуками может быть не React 16.7.</p>

    <p>Хуки представляют наше видение будущего React. Они решают как проблемы, с которыми непосредственно
        сталкиваются пользователи React («адская оболочка» для render-свойств и компонентов более высокого
        порядка, дублирование логики в методах жизненного цикла), так и проблемы, с которыми мы столкнулись
        при оптимизации React в масштабе (например, трудности со встраиванием компонентов с помощью компилятора).
        Хуки не делают классы устаревшими. Однако, если хуки получат успех, возможно, что в будущем major
        релизе поддержка классов может быть перенесена в отдельный пакет, уменьшив размер бандла React по умолчанию.</p>

    <br/>

    <p><b>Статус в React DOM</b>: первой версией <code>react</code> и <code>react-dom</code>, поддерживающей хуки, является <code>16.7.0-alpha.0</code>.
        Мы ожидаем, что в ближайшие месяцы будет опубликовано больше альфа-версий (на момент написания статьи
        последней была <code>16.7.0-alpha.2</code>). Вы можете попробовать их, установив <code>react@next</code> и <code>react-dom@next</code>. Не
        забудьте обновить <code>react-dom</code> - иначе хуки не будут работать.</p>

    <br/>

    <p><b>Статус в React DOM Server</b>: те же 16.7 альфа-версии <code>react-dom</code> полностью
        поддерживают хуки и для <code>react-dom/server</code>.</p>

    <br/>

    <p><b>Статус в React Native</b>: пока что не существует официального сопсоба попробовать хуки в React Native.
        Если вы любите приключения, ознакомьтесь с неофициальными инструкциями <b><a href="${hooksInRNUrl}">здесь</a></b>. Существует
        известная проблема, когда <code>useEffect</code> срабатывает слишком поздно, которая все еще не решена.</p>

    <br/>

    <p><b>Рекомендация:</b> Когда вы будете готовы, мы рекомендуем вам попробовать использование хуков в
        новых написанных вами компонентах. Убедитесь, что все члены вашей команды знакомы с хуками и этой
        документацией. Мы не рекомендуем переписывать существующие классы, если вы не планируете их
        переписывать в любом случае (например, исправлять ошибки). Узнайте больше о
        <b><a href="${hooksAdoptionStrategyUrl}">стратегии внедрения хуков здесь</a></b>.</p>

    <br/>

    <h3>React 16.x (~второй квартал 2019): добавление функции Concurrent Mode</h3>

    <br/>

    <p><b>Параллельный режим</b> позволяет приложениям React быть более отзывчивыми, отображая деревья
        компонентов без блокировки основного потока. Он включен и позволяет React прерывать длительную
        отрисовку (например, отрисовку новой истории изменений) для обработки события с высоким приоритетом
        (например, ввода текста(change) или наведения(hover)). Параллельный режим также повышает удобство работы
        с приостановкой, пропуская ненужные состояния загрузки при быстрых соединениях.</p>

    <br/>

    <app:alert title="Внимание!" type="warning">
        Возможно, вы уже слышали, что параллельный режим ранее назывался «асинхронный режим».
        Мы изменили название, чтобы подчеркнуть способность React выполнять работу на различных
        уровнях приоритета. Это отличает его от других подходов к асинхронной отрисовке.
    </app:alert>

    <ce:code-example-3/>

    <p>Для параллельного режима еще нет документации. Важно подчеркнуть, что его концептуальная модель,
        скорее всего, поначалу будет вам незнакомой. Документирование его преимуществ, способов его
        эффективного использования и ошибок является для нас первоочередной задачей и будет необходимым
        условием для того, чтобы назвать его стабильным. До тех пор <b><a href="${andrewTalksUrl}">обсуждение Эндрю</a></b> - лучшее из
        доступных источников по даной теме.</p>

    <p>Параллельный режим гораздо менее отточен, чем хуки. Некоторые API еще не настроены должным образом и не
        выполняют то, что ожидается. На момент написания этого поста мы не рекомендуем использовать параллельный
        режим ни для чего, кроме экспериментов. Мы не ожидаем много ошибок в самом параллельном режиме, но учтите,
        что компоненты, которые выдают предупреждения в <code>&lt;React.StrictMode&gt;</code>, могут работать некорректно. Отдельно отметим:
            мы видели, что в параллельном режиме выявляются проблемы с производительностью в стороннем коде, которые
            иногда можно принять за проблемы с производительностью в самом параллельном режиме. Например, случайный
            вызов <code>setInterval(fn, 1)</code>, который выполняется каждую миллисекунду, будет давать ухудшающий эффект в
            параллельном режиме. Мы планируем опубликовать дополнительные рекомендации по диагностике и устранению
            подобных проблем как часть документации этого релиза.</p>


    <p>Параллельный режим - большая часть нашего видения React. Для работы, связанной с процессором это позволяет
        неблокировать отрисовку и поддерживать отзывчивость вашего приложения при отрисовке сложных деревьев компонентов.
        Это продемонстрировано в первой части нашего выступления на JSConf Iceland. Параллельный режим также улучшает
        работу приостановки. Он позволяет избежать мерцания индикатора загрузки, если сеть достаточно быстрая. Трудно
        объяснить, не наблюдая это вживую, поэтому разговор Эндрю - лучший ресурс, доступный сегодня. В параллельном режиме
        используется совместный планировщик основных потоков, и мы сотрудничаем с командой Chrome, чтобы в конечном
        итоге перенести эту функцию в сам браузер.</p>

    <br/>

    <p><b>Статус в React DOM</b>: очень нестабильная версия параллельного режима доступна под префиксом <code>unstable_</code> в React 16.6, но мы не рекомендуем
        пробовать ее, если вы не хотите часто сталкиваться со стенами или отсутствующими функциями. Альфа 16.7 включает в
        себя <code>React.ConcurrentMode</code> и <code>ReactDOM.createRoot</code> без префикса <code>unstable_</code>, но мы, скорее всего, сохраним префикс в 16.7,
        и пометим параллельный режим как стабильный в этом будущем minor релизе.</p>

    <br/>

    <p><b>Статус в React DOM Server</b>: параллельный режим не влияет напрямую на серверную отрисовку. Он
        без проблем будет работать с существующим движком.</p>

    <br/>

    <p><b>Статус в React Native</b>: Текущий план - отложить включение параллельного режима в React Native
        до тех пор, пока проект React Fabric не будет близок к завершению.</p>

    <br/>

    <p><b>Рекомендация:</b> Если вы хотите использовать параллельный режим в будущем, обертывание определенных
        поддеревьев компонентов в <code>&lt;React.StrictMode&gt;</code> и исправление появляющихся предупреждений - будет хорошим первым шагом.
            В целом не ожидается, что устаревший код будет абсолютно совместимым. Например, в Facebook мы
            намереваемся использовать параллельный режим в основном в более свежем коде, а устаревший код в ближайшем
            будущем будем поддерживать работающим в синхронном режиме.</p>

    <br/>

    <h3>React 16.x (~второй квартал 2019): добавление приостановки для извлечения данных</h3>

    <br/>

    <p>Как упоминалось ранее, приостановка относится к способности React «приостанавливать» отрисовку, когда
        компоненты чего-то ждут, и отображать индикатор загрузки. В уже выпущенном React 16.6 единственным
        поддерживаемым вариантом использования приостановки является разбиение кода. В будущем minor релизе
        мы также хотели бы предоставить официально поддерживаемые способы её использования для извлечения данных.
        Мы предоставим эталонную реализацию базового «React Cache», который совместим с приостановкой, но вы
        также можете написать и свой собственный. Библиотеки извлечения данных, такие как Apollo и Relay, смогут
        интегрироваться с приостановкой, следуя простой спецификации, которую мы предоставим.</p>

    <ce:code-example-4/>

    <br/>

    <p>Официальной документации о том, как извлекать данные с помощью приостановки, пока нет, но вы можете
        найти некоторую раннюю информацию в <b><a href="${suspenseTalksUrl}">этом выступлении</a></b> и в <b><a href="${suspenseDemoUrl}">этой небольшой демонстрации</a></b>. Мы напишем
        документацию для React Cache (и как написать вашу собственную Suspense-совместимую библиотеку) ближе
        к этому релизу React, но если вам интересно, вы можете найти его очень ранний исходный код <b><a href="${reactCacheUrl}">здесь</a></b>.</p>

    <p>Предполагается, что низкоуровневый механизм приостановки (приостанавливающий отрисовку и показывающий резервный UI)
        будет стабильным даже в React 16.6. Мы использовали его для разбиения кода в продакшене в течение нескольких месяцев.
        Однако высокоуровневые API для извлечения данных очень нестабильны. React Cache быстро меняется и будет меняться как
        минимум еще несколько раз. Некоторые низкоуровневые API пока отсутствуют создания для хорошего высокоуровневого API.
        Мы не рекомендуем использовать React Cache нигде, кроме экспериментов. Обратите внимание, что сам React Cache не
        привязан строго к релизам React, но в современных альфа-версиях отсутствуют базовые функции, такие как аннулирование
        кэша, и вы очень скоро столкнетесь со стеной. Мы ожидаем получить что-то полезное с грядущим релизом React.</p>

    <p>В конце концов, мы хотели бы, чтобы большая часть выборки данных осуществлялась через приостановку, но
        потребуется много времени, чтобы все интеграции были готовы. На практике мы ожидаем, что он будет принят
        очень плавно, и часто через слои, такие как Apollo или Relay, а не напрямую. Отсутствие высокоуровневых
        API-интерфейсов - не единственное препятствие - есть также некоторые важные шаблоны пользовательского
        интерфейса, которые мы пока не поддерживаем, такие как <b><a href="${issue14248Url}">отображение индикатора прогресса вне иерархии
            представления загрузки</a></b>. Как всегда, мы будем сообщать о наших достижениях в заметках о релизе в этом блоге.</p>

    <br/>

    <p><b>Статус в React DOM и React Native</b>: технически, совместимый кеш уже будет работать с <code>&lt;React.Suspense&gt;</code> в React 16.6. Тем не
        менее, мы не ожидаем, что у нас будет хорошая реализация кеша, пока не выйдет minor версия React. Если вы желаете авантюры,
        вы можете попробовать написать собственный кеш, взглянув на альфа-версии React Cache. Тем не менее, обратите внимание,
        что ментальная модель достаточно отличается, так что существует высокий риск ее неправильного понимания до тех пор,
        пока не будут готова документация.</p>

    <br/>

    <p><b>Статус в React DOM Server</b>: Приостановка еще не доступна в серверной отрисовке. Как мы упоминали ранее,
        мы начали работу над новым асинхронным движком серверной отрисовки, который будет поддерживать приостановку,
        но это большой проект, и для его завершения потребуется 2019 год.</p>

    <br/>

    <p><b>Рекомендация:</b> Дождитесь minor версии React, чтобы использовать приостановку для извлечения данных.
        Не пытайтесь для этого использовать функции приостановки в 16.6 - они не поддерживаются. Однако
        ваши существующие <code>&lt;Suspense&gt;</code> компоненты для разбиения кода также смогут отображать и состояние загрузки данных,
            когда приостановка для извлечения данных станет поддерживаться официально.</p>

    <br/>
    <br/>
    <div class="gray-line"></div>

    <h2>Другие проекты</h2>

    <br/>

    <h3>Модернизация React DOM</h3>

    <br/>

    <p>Мы начали исследование по <b><a href="${issue135258Url}">упрощению и модернизации</a></b> ReactDOM с целью уменьшения размера пакета и выравнивания
        ближе к поведению браузера. Пока еще рано говорить о том, какие конкретные пункты «дойдут до конца», потому что
        проект находится на стадии исследования. Мы будем сообщать о нашем прогрессе в этом вопросе.</p>

    <br/>

    <h3>Приостановка для серверной отрисовки</h3>

    <br/>

    <p>Мы начали проектировать новый движок серверной отрисовки (серверный визуализатор), который
        поддерживает приостановку (включая ожидание асинхронных данных на сервере без двойной отрисовки) и постепенно
        загружает и насыщает содержимое страницы порциями для лучшего взаимодействия с пользователем. Вы можете
        посмотреть обзор его раннего прототипа в <b><a href="${talksServerRendererUrl}">этом докладе</a></b>. Новый движок будет в центре нашего внимания в 2019 году,
        но пока рано говорить о графике выпуска. Его развитие, как всегда, будет <b><a href="${serverRendererGitUrl}">происходить на GitHub</a></b>.</p>

    <br/>
    <br/>
    <div class="gray-line"></div>

    <br/>
    <br/>

    <p>На этом всё! Как видите, нам есть чем заняться, но мы ожидаем большого прогресса в ближайшие месяцы.</p>

    <p>Мы надеемся, что данный пост даст вам представление о том, над чем мы работаем, что вы можете
        использовать сегодня и что вы можете ожидать в будущем. Несмотря на то, что происходит много дискуссий о
        новых функциях в социальных сетях, вы не пропустили ничего важного, если прочитали этот блог.</p>

    <p>Мы всегда открыты для обратной связи и рады услышать ваши отзывы в
        <b><a href="${rfcsUrl}">репозитории RFC</a></b>, <b><a href="${issuesUrl}">треккере</a></b> и
        <b><a href="${twitterUrl}">Твиттере</a></b>.</p>
</div>

<c:url var="prevPageUrl" value="react-v16.6.0"/>

<app:page-navigate
        pageStartAncor="pageStart"
        prevPageUrl="${prevPageUrl}"
/>