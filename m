Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B72FA798C45
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 20:10:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Dc/osrec;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj4093yxpz3c8V
	for <lists+openbmc@lfdr.de>; Sat,  9 Sep 2023 04:10:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Dc/osrec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj3zX1wKTz3c4t
	for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2023 04:09:42 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401da71b7faso27442095e9.2
        for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2023 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1694196575; x=1694801375; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bgEzGiwkKWBx+y30xyO2l8JcwxwxFSYdaRt+6eaH0M=;
        b=Dc/osrecILRPy6vbOQ6r2q0jJv+YOFyit2lrrQ52bVLdoZe5mlji/2B2q3DS5rdUqW
         8VuQ0XVJFotuyMVXaHTmDevmaJxsXhsZLNSG4dEElpI3kKgjBF0FmlA3Xd1n7X68ueQW
         M25LelkJ2m0+3+gMMBKhIuMimy2HRVCS20qGswVhwoY8Ot9refbmlz0ZoM+EfVMjVtKY
         9guxF/2r2xOEDtvQ7va8yxroogCK18fpmIgNrZJxur36aF1+mEQjaZZm7gRX0tPyrsR9
         JtwJ4fC+LzwZ7Xo36vosQINdjoItBNUHEtWXNtD0TIhcyRnZ+1z/LNWqaEbSmUVrcsQV
         Jv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694196575; x=1694801375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bgEzGiwkKWBx+y30xyO2l8JcwxwxFSYdaRt+6eaH0M=;
        b=Gxy1YNfxcavw76cw6S3MvImwGVRolVMP31s+88/7mYXCxOg87l9yCCOxeelko2CIfB
         YrJNlomKrpumRBLBZIdetqnkunnj/s/NLmPxHqhYUslPr53xnNwu8zDvNAzj8vdos3nw
         DEuu5pd8fAYSORurjowIJvtAnzLrAOE0+YyC/x3OWQBCdPe6QbdVjJpAt3kSu6XOtnPg
         y/vDkcOd5aRAsu8O97DxYHwxJEu8rxn64wbeSpROioZx2HH/er8ie170EWtjTqZIPY/p
         BfmxLTTe5CFAseMzKan5Rkh1QXxTRriru4qxYTY0QitODz3idPVF0UJJsZBN31aD2ajv
         CfNw==
X-Gm-Message-State: AOJu0YwfkYqlOuEujYrH6JSEy7DZNJ75Of7f7aLB2sdsRgYtS8NbUz4C
	a1/0uoQrDJlh6g3Ykacm6+YDtl4W9mHSTOldKYQE/A==
X-Google-Smtp-Source: AGHT+IHIzPuMOIhY1mOUsyzZ3Y1HW/TkBSGTRl1xoGaqok6uFXVrpfmtuT7StwZJhrniKxWNLElhEPTMqbLy9wlehk8=
X-Received: by 2002:adf:fd4d:0:b0:319:67da:ed68 with SMTP id
 h13-20020adffd4d000000b0031967daed68mr2807022wrs.7.1694196575429; Fri, 08 Sep
 2023 11:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <LV2PR12MB601437AEF8603C553E64CB9CCDEEA@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxBomVGsp1hTjiyzz_Fh5adwQW_Tp+3o2B-w-0aqxguBAQ@mail.gmail.com> <LV2PR12MB60145489EE90BFE702A93E15CDEDA@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To: <LV2PR12MB60145489EE90BFE702A93E15CDEDA@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 8 Sep 2023 11:09:24 -0700
Message-ID: <CACWQX80cX-Q=UJOwXTGYMuDNKFUthXv1YAhax72dZUKFjaYL0Q@mail.gmail.com>
Subject: Re: bmcweb multi-threaded solution
To: Rohit Pai <ropai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Ed Tanous <edtanous@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 8, 2023 at 5:57=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote:
>
> Hello Ed,
>
> Sharing the code snippets for the two approaches we have tested.
>
> 1. Original Patch + Thread Pool
>
> webserver_main.cpp ------------------------------------------------------=
---------------------------------------------------------------------------=
-
>
> void runIOService()
> {
>     BMCWEB_LOG_INFO << "Starting ASIO worker thread";
>     boost::asio::io_context& io =3D crow::connections::getIoContext();
>     io.run();
>     BMCWEB_LOG_INFO << "Exiting ASIO worker thread";
> }
>
> static int run()
> {
>     .......
>     app.run();
>
>     // Create a vector of threads
>     std::vector<std::thread> threads;
>
>     //Create and launch the threads
>     // 2 threads would be created for AST2600
>     for (unsigned int i =3D 0; i < boost::thread::hardware_concurrency();=
 ++i)
>     {
>         threads.emplace_back(runIOService);
>     }
>
>     // Wait for all threads to finish
>     for (auto& thread : threads) {
>         thread.join();
>     }
>
>     return 0;
> }
>
> With this approach we are facing the issue of dbus connections being shar=
ed between threads issue which I have explained previously.
>
>
>
> 2. Original Patch + Dedicate thread for special MRD URIs
>
> webserver_main.cpp ------------------------------------------------------=
---------------------------------------------------------------------------=
-
>
> void runIOService()
> {
>     BMCWEB_LOG_INFO << "Starting ASIO worker thread";
>     boost::asio::io_context& io =3D crow::connections::getNextIoContext()=
;
>     io.run();
>     BMCWEB_LOG_INFO << "Exiting ASIO worker thread";
> }
>
> static int run()
> {
>     crow::Logger::setLogLevel(
>         static_cast<crow::LogLevel>(bmcwebLogLevel));
>
>     boost::asio::io_context& io =3D crow::connections::getIoContext();
>     App app(io);
>     // Create a work object to prevent ioContext.run() from returning imm=
ediately
>     auto work =3D make_work_guard(crow::connections::getNextIoContext());
> .....................
>     app.run();
>
>     // Create a vector of threads
>     std::vector<std::thread> threads;
>
>     //Create and launch the threads
>    // Test code with one MRD handler thread
>     for (unsigned int i =3D 0; i < 1; ++i)
>     {
>         threads.emplace_back(runIOService);
>     }
>     io.run();
>     work.reset();
>     // Wait for all threads to finish
>     for (auto& thread : threads) {
>         thread.join();
>     }
> }
>
> dbus_singleton.cpp-------------------------------------------------------=
---------------------------------------------------------------------------=
-
>
> boost::asio::io_context& getNextIoContext()
> {
>     int threadCount =3D 4;
>     static boost::asio::io_context io(threadCount);
>     return io;
> }
>
> dbus_singleton.hpp-------------------------------------------------------=
---------------------------------------------------------------------------=
-
> boost::asio::io_context& getNextIoContext();
>
>
> Platform Specific MRD URI handling
> metric_report.hpp--------------------------------------------------------=
---------------------------------------------------------------------------=
-
>
> inline void
>     getPlatforMetrics(const crow::Request& req, const std::shared_ptr<bmc=
web::AsyncResp>& asyncResp,
>                       const std::string& metricId,
>                       const uint64_t& requestTimestamp =3D 0)
> {
>             boost::asio::post(
>                 crow::connections::getNextIoContext(), [req, asyncResp]()=
 {
>
>                     nlohmann::json& resArray =3D
>                         asyncResp->res.jsonValue["MetricValues"];
>
>
>              // Test code which populates 5K objects for the response
>                    // In our actual implementation code we read this data=
 from shared memory based backend API
>               nlohmann::json thisMetric =3D nlohmann::json::object();
>                     for (int i=3D0; i < 5000; i++) {
>                         thisMetric["MetricValue"] =3D 0;
>                         thisMetric["MetricProperty"] =3D "/redfish/v1/Fab=
rics/System_0/XYZ ";
>                         thisMetric["Timestamp"] =3D "2020-03-27T16:50:58.=
516+00:00";
>                         resArray.push_back(thisMetric);
>                     }
>
>                     boost::asio::post(*req.ioService, [asyncResp](){
>                         messages::success(asyncResp->res);
>                     });
>                 });
> }
>
> This code works well for some period but has stability issues.
> I was not sure if cross posting asio jobs between context is stable or no=
t hence I wanted to test it with just simple boost::asio code.
> I created this defect https://github.com/chriskohlhoff/asio/issues/1352 a=
s I was able to repro the issue with boost::asio code which is present in t=
he bug description.
>

Please submit patches to gerrit, mark them WIP, and make sure they
build.  What you wrote above won't build due to logging changes made a
while ago on mainline, so it's not very helpful.  With that said, if
the above is the only code you wrote, you're missing multi-threading
locks in quite a few places, which is likely why your code is crashing
but let's discuss that on gerrit, where we can talk line by line in
the diff.

>
> Thanks
> Rohit PAI
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, September 8, 2023 1:20 AM
> To: Rohit Pai <ropai@nvidia.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: bmcweb multi-threaded solution
>
> External email: Use caution opening links or attachments
>
>
> On Thu, Sep 7, 2023 at 2:36=E2=80=AFAM Rohit Pai <ropai@nvidia.com> wrote=
:
> >
> > Hello All,
> >
> >
> >
> > This previous thread captures the motive behind our interest in chasing=
 multi-threaded solution for bmcweb.
> >
> > Thanks to Ed for putting up this initial patch.
> > https://gerrit.openbmc.org/c/openbmc/bmcweb/+/63710
> >
> >
> >
> > We have been testing this patch in the recent times and I wanted to put=
 a summary of our observations.
> >
> >
> >
> > The original patch was not creating any explicit threads and we did not=
 find boost::asio creating them for us.
> >
> > So as per this article from boost I modified the patch to create a thre=
ad pool and share the same IO context among all threads.
> >
> > When I tested this change, I found two problems.
> >
> > Sharing same IO context between multiple threads does not work.
> >
> > I have logged this issue  https://github.com/chriskohlhoff/asio/issues/=
1353  in boost::asio git hub page with sample code to reproduce the issue.
> >
> > It would be great if someone else test this sample code and share the r=
esults based on their platform.
> >
> > Sharing dbus connection across threads is not safe:
> >
> > when we share same IO context between multiple threads, it=E2=80=99s po=
ssible that the async job posted by one thread, can be picked up by some ot=
her thread.
> >
> > If thread1 makes crow::connections::systemBus().async_method_call then =
the response lambda can get executed in thead2=E2=80=99s context.
> >
> > When thread2 is trying to read from the dbus connection, thread1 can ma=
ke a new request on the same bus connection as part of handling another URI=
 request.
> >
> > Sdbus is not thread safe when connection object is shared between multi=
ple threads which can perform read/write operations.
> >
> >
> >
> > IO Context per thread.
> >
> > Since sharing IO context was not working I took the second approach men=
tioned in this article which is to dedicate IO context per threads.
> >
> > Major design challenge with this approach is to decide which jobs must =
be executed in which IO context.
> >
> > I started with dedicating one thread/IO context to manage all the incom=
ing requests and handling responses back to the clients.
> >
> > I dedicated another thread/IO context to only manage aggregate URIs whi=
ch have 1K+ sensors response (MRDs) to populate and does not have tighter l=
atency requirements.
> >
> > Our goal is to have faster response on the power/thermal URIs which is =
served by the main thread and is not blocked by huge response handling requ=
ired by aggregate URIs which is managed by the secondary thread.
> >
> > From our previous performance experiments, we had found that JSON respo=
nse preparation for 5K+ sensors was taking around 250 to 300ms in bmcweb du=
ring which power/thermals URIs were blocked.
> >
> >
> >
> >      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90          =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
> >
> >      =E2=94=82MainThread=E2=94=82          =E2=94=82MRD_Handler_Thread=
=E2=94=82
> >
> >      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98          =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
> >
> >                 =E2=94=82   asio::post(request)        =E2=94=82
> >
> >                 =E2=94=82 =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80>
> >
> >                 =E2=94=82                                            =
=E2=94=82
> >
> >                 =E2=94=82   asio::post(response)     =E2=94=82
> >
> >                 =E2=94=82 <=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> >
> >      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90          =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
> >
> >      =E2=94=82MainThread=E2=94=82          =E2=94=82MRD_Handler_Thread=
=E2=94=82
> >
> >      =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98          =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
> >
> >
> >
> > Based on the URI main thread decides to continue to process the request=
 or offload it to the MRD handler thread.
> >
> > The response received from the MRD thread is returned to the client by =
the main thread.
> >
> >                The performance results with the solution are great. We =
see almost 50% improvement in the performance of power/thermal URIs.
> >
> >                Here is performance is measured based on worst case late=
ncy seen on power thermal URIs when there are concurrent clients accessing =
power/thermal + MRD URIs.
> >
> >
> >
> >                However, this solution seems to have some stability issu=
es in the overnight long run tests.
> >
> > The crash is seen around boost:post APIs in multi-threading context. I
> > have logged a different bug in boost::asio to demonstrate this
> > problem. https://github.com/chriskohlhoff/asio/issues/1352
> >
> > I will follow up to check if boost can help us with this fix.
> >
> >
> >
> > What I am looking for
> >
> > Does anyone have any different proposal for sharing IO context between =
threads which can work our bmc platform?
> > Feedback on handling dbus connection between multiple threads in the co=
ntext of bmcweb?
> > Is this a good model to dedicate threads based on the use case as we ar=
e not able to make IO sharing between threads work well?
> > Any better way to Post asio jobs across threads and make it stable?
> >
> >
>
> The above is great, but if you don't post the code you're using, it's rea=
lly difficult to provide any input.  Your stability issues could be simply =
due to missing locks, or unintended multi-threaded sharing, but it's hard t=
o know without being able to look at the code you're using.
> I would highly recommend building your binary with thread sanitizer.
>
> >
> > Thanks
> >
> > Rohit PAI
> >
> >
