Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81079714B
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 11:37:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=edKNZpOl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhDg76mFXz3c5J
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 19:37:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=edKNZpOl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::605; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhDfR5cJ2z3bpp
	for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2023 19:37:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlmMI5pGNF5fc5bG+i14BqJ6Gn7mW5xLfJ6W1IUL2z1Pr3pnybsXgP2dK10g0yffJ4SVIn7+MM0T9eHfa7pMWikgwtzp6cFREoR2ZRx2+3FkqkGQT1+9ScI9RDDNjThQB4jfwIkUpko/hkrrpuluHZPjaSdTT0mjmtoEIObpSMMjlYDlK3B/yzwc7aB8UIhrPK/1gGOGVZvzRjT39lg6WTNz+oDqV9ij2SG8oVM0Yr/anufSjsRf/F28OA1l8jvoTU9ESlN5JPSwB5OWsvcwC8ozjLLDn+m6RMo/z2ClDfNHoVcN5w+wVlGZ4dVi50Dy6IHSSg/Q6MlHdBusAxbX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N52u1j48Wz9DV1ALQwiiN9DDFY2WHfBSsVv9/FU06R8=;
 b=KZbHchdtD3BwBjt3277ntTRozP2NsgkWMalKpC76TqpoYmJKZ3frEGFYE+KLy8jjpZakI+I3OZ2G5ZjPZA4GHbnZAnFw8jTDMO8jlKT5WqXBXQHudegopjNtCDRVPEoNclrotMtP45tbVk4J5qar4P+zc5J776rewTE8r9XGGo9WP5N/ufZxjrqpxo0B59O+RHMmpdUywwK08KwoHaHrY83Krwo1phx6BKfedjeaSO01s10wfp/bUJibzRawYtTBoCf3oaNVNDvPR93sx1vvJLMiZkzZ/9iG/dh4cPiX4BZUmYjc7HG0PS8hUfoU4ubxVGsC2FN7eqni8hNMPdOLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N52u1j48Wz9DV1ALQwiiN9DDFY2WHfBSsVv9/FU06R8=;
 b=edKNZpOlMxr8fk2qorNkNWd34Fl60d5KmcbfpRtKyvXTwYB7OWVtQ3mgus/OQG9ZdXYkmHXVEpL3CpDzUihyEvMRAvpI9ukyXXYspQW7ROHQ1z/QFhV/oB5GRQH9T2wuRZUrytkE0nc40751yv9miTJb/FMipwE285qw+KsJZlqvmPtagy4kfhiKw2SaVajziUMNN0z0SZ574/C8Pme6jRLqKD+Ayr0fWkbit1QoVRlvDpFPvQvlkktPmwvND28lpwQ4LIKIzVBHJWoXDbeFekdfuARQItdvcLhPxS07vaENypRkPj87oecGBEVq9lvKdgA0yvSOPG/YBSnNOs0X1A==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 09:36:37 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::f121:a2d7:63ef:995b]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::f121:a2d7:63ef:995b%5]) with mapi id 15.20.6768.029; Thu, 7 Sep 2023
 09:36:37 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous
	<edtanous@google.com>
Subject: bmcweb multi-threaded solution 
Thread-Topic: bmcweb multi-threaded solution 
Thread-Index: Adnhbrhovox9XvdEREKMWuirHuajkw==
Date: Thu, 7 Sep 2023 09:36:37 +0000
Message-ID:  <LV2PR12MB601437AEF8603C553E64CB9CCDEEA@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|CH3PR12MB8259:EE_
x-ms-office365-filtering-correlation-id: 7fc9f830-7555-4e71-b28e-08dbaf85ee9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  q5NEeqiFjEXF8wluUd26QWQkPzWV+zvIcT1tTaNvPjKbd0p1SZxLJ3SEBvZug5oazWiCn8WUXPqq5gMGMNuL+dx9fsJslRLeIaiZMCaUOvgJYvPomETVmObceHM7Co3R8KzNF1FflFiRtu/d19cZRQS8m2ASi7op8PpiFSafOPLcPknawERGdIgGomexbY9ToPlf5gtiGs12Sp9mhK80wvJLkGPVIlas+VBDDvRuLCj49YmQ0TUYu+e7P1QtOexaan0lR4fzfpSyCCxGeooQdG9izrPtJ7+pjDdN37PhLkfTDbwhpjX7zLtnFgDD2tSxLSJ2QkZO2z2NPytv4Ol5qajWxb3L3JtpVL0r0Xcl7fl05/2MQEd9+n58tIcFPSi5aHRq2G1UFDxFhBjIap+QHscx/BAeGnk5xgnjzeaBSkcTOHM6RUQo2MQIo694kL+ZyvnkmlkE+nZUQKLZJrEhiDK+nUypsMTTqdBAL/UksJIDk4ErxZpSCIQygzDjUiOl30RuHcKBAQDQ2DQXT2ZKY+PIik37YtlIhowfEkMpTdKyai3tZPAKeUdpzMhF/bcwaVp6buZIuuOwPC7wRpPL2ePyaFIQRKRZqS7sGNIsPtvnHvBRUqXWd6BBsgu5RFi+3795H1QuNydal3tDzyik0w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(366004)(39860400002)(346002)(1800799009)(451199024)(186009)(122000001)(71200400001)(7696005)(6506007)(38100700002)(86362001)(55016003)(166002)(38070700005)(33656002)(3480700007)(4743002)(26005)(966005)(9686003)(83380400001)(478600001)(110136005)(52536014)(76116006)(8936002)(9326002)(8676002)(5660300002)(21615005)(2906002)(66556008)(66446008)(316002)(66476007)(64756008)(66946007)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?koi8-r?Q?DAw96Lngq1FfBASnSy9ZbOeS3Zm/hIJVPBrmficFSEBF1+8SoZ3+GsiU8W7qOZ?=
 =?koi8-r?Q?PAUFrTe/MyiXNIdAvIsGzBiYgGTBT0HAI5H3G0MakQ2B7VmrYhvWMxVAPfaTyT?=
 =?koi8-r?Q?p3Mmc9T4nHwG9X2acKazbvbhUa5RUBTo/9XDucfFjfEapc8JCy2a/DBPZ+nJXJ?=
 =?koi8-r?Q?kUsyLtaX2Ccrhn5ILaNCJfoGp2FARGWKziWNGPh2wla6g6eG7Lrz5dfKcXhyhk?=
 =?koi8-r?Q?MsflylSDgT42+75HTSERvNU2JFTkiXJ6QLRG3GAu0dQXHWryhKK9JvU4p/OJDY?=
 =?koi8-r?Q?J8F7fzyDcuxAgYpORXXVaoWtxfPYALwRHgREHubfQ0m14ym2uTrra6oJfijbst?=
 =?koi8-r?Q?HnRlVrea2BFaFYLDZ42jS7mtbOeZnyHEdBmedSAp7Hwvr+/KTA91ORCXMGVuo3?=
 =?koi8-r?Q?Trm5g/aa2U2wuAbAR8ErUWO7vOB1F2vfBL2DPNl9dRzr9yJYELXbJwdNLEBk8b?=
 =?koi8-r?Q?OSZLiT+d6wNEr2eCLH3aOtLvOcs2HbqOIW9iieKrEeIJFRgUVmiLFB92oF6DNS?=
 =?koi8-r?Q?mdJ2Igc1IefeIqrJmj7/2Epi0jz38edSs4DPyT/6eTfKhb0nJb1ht8o/ERAW8C?=
 =?koi8-r?Q?skNI0/TI+I+6vl/ba1S+z2yygDCt9hZ8GHXPKGymXymDahVIAwADWEDGz2a9lv?=
 =?koi8-r?Q?qG0wyRDqnYaRd+HW+9CyKKu6trnyuciYDOwicBczCjfcRWH45OZahsT04so9wv?=
 =?koi8-r?Q?tgRqzy7xUIP0pxTqBJlmnzyhfbD7+xkxyJqR0h0jAQ0IWCXbFWnww52CTCjpfj?=
 =?koi8-r?Q?GvLm4OR5iGmQc41wBC2oFw4xpQ91gDaicRKuhL5KMS2NrCib+bdAoeptOwkM/K?=
 =?koi8-r?Q?AKoiA6mcH+XStR3kLLEewQbXZHsaHw3WOylPBBUd8DHmTBGqTyX+py+OOoXtF/?=
 =?koi8-r?Q?AXN5g1PvZYxISOPIyqxHIZS8LSe6a63v6/gP7KIXa43Qko52V6wqZ/7yM9DvHT?=
 =?koi8-r?Q?j6CEkyYHjkFvLcnsginGtqZ4o0nO14Pb38PalUWjB3YW4dWxlH4GZGO4iynNYP?=
 =?koi8-r?Q?xIsb7tjDNxLydUPEdcUzMt5c8EcTOErsL7crbR82n+KYB5bSnQRdkILEM0Vb14?=
 =?koi8-r?Q?UHxrKwRZdgL6rV+XkwqloG+x/plncjaHaPtHgtCGZ1gh19G+ubFwMGkCDv4jIC?=
 =?koi8-r?Q?fYufk0A4NTQ3PER/lQnUpERn7NZKQJ5n0Z7JwHPtapSUUCAWlPYxD39gk4DSbR?=
 =?koi8-r?Q?F5I/CqBwqm91Q6QBZtEJA3pJjjVzXaQezr3FqyHa2fytowPuNmHETDjQGS2dXE?=
 =?koi8-r?Q?cNrsx/AHMKuAD149aOOXk/pmSVeU/W4u1mZ7FkvyTXpwBBFVW8dCmrQgFfu5hK?=
 =?koi8-r?Q?p4pu0Pw3SATp1fH967em/hR27EEKdIfNqzq3t2gRIPQxkc7/kk3YFu3Ra0Jdd1?=
 =?koi8-r?Q?T/PPq89c8qfJQr+CGk1UTlig0K5VL+L4jEhwdtS7xxdrY4OimW9c9bUIPTsGLn?=
 =?koi8-r?Q?wdsEQtKWcYMu6U2Ak8G/dMJ97/GYs41MuvbSvdelReMvogtzpdxPFqdWtYHryw?=
 =?koi8-r?Q?FX39YMC4afej1tkSk0J4slo1amBaU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB601437AEF8603C553E64CB9CCDEEALV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc9f830-7555-4e71-b28e-08dbaf85ee9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 09:36:37.1679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8hoXkeLUClrK3OaF81xIkyyqUVxmURVhSmGkhOwhsfn34tZapGc3DZBROuG1ysF0CpN8MYQmIRzW+n1/nnbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_LV2PR12MB601437AEF8603C553E64CB9CCDEEALV2PR12MB6014namp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hello All,

This previous thread<https://lists.ozlabs.org/pipermail/openbmc/2023-May/03=
3495.html> captures the motive behind our interest in chasing multi-threade=
d solution for bmcweb.
Thanks to Ed for putting up this initial patch. https://gerrit.openbmc.org/=
c/openbmc/bmcweb/+/63710

We have been testing this patch in the recent times and I wanted to put a s=
ummary of our observations.


  1.  The original patch was not creating any explicit threads and we did n=
ot find boost::asio creating them for us.

So as per this article<https://theboostcpplibraries.com/boost.asio-scalabil=
ity> from boost I modified the patch to create a thread pool and share the =
same IO context among all threads.

When I tested this change, I found two problems.

  1.  Sharing same IO context between multiple threads does not work.

I have logged this issue  https://github.com/chriskohlhoff/asio/issues/1353=
  in boost::asio git hub page with sample code to reproduce the issue.

It would be great if someone else test this sample code and share the resul=
ts based on their platform.

  1.  Sharing dbus connection across threads is not safe:
when we share same IO context between multiple threads, it's possible that =
the async job posted by one thread, can be picked up by some other thread.
If thread1 makes crow::connections::systemBus().async_method_call then the =
response lambda can get executed in thead2's context.
When thread2 is trying to read from the dbus connection, thread1 can make a=
 new request on the same bus connection as part of handling another URI req=
uest.
Sdbus is not thread safe when connection object is shared between multiple =
threads which can perform read/write operations.



  1.  IO Context per thread.

Since sharing IO context was not working I took the second approach mention=
ed in this article<https://theboostcpplibraries.com/boost.asio-scalability>=
 which is to dedicate IO context per threads.

Major design challenge with this approach is to decide which jobs must be e=
xecuted in which IO context.

I started with dedicating one thread/IO context to manage all the incoming =
requests and handling responses back to the clients.

I dedicated another thread/IO context to only manage aggregate URIs which h=
ave 1K+ sensors response (MRDs) to populate and does not have tighter laten=
cy requirements.

Our goal is to have faster response on the power/thermal URIs which is serv=
ed by the main thread and is not blocked by huge response handling required=
 by aggregate URIs which is managed by the secondary thread.

From our previous performance experiments, we had found that JSON response =
preparation for 5K+ sensors was taking around 250 to 300ms in bmcweb during=
 which power/thermals URIs were blocked.



     =82=80=80=80=80=80=80=80=80=80=80=83          =82=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=83

     =81MainThread=81          =81MRD_Handler_Thread=81

     =84=80=80=80=80=88=80=80=80=80=80=85          =84=80=80=80=80=80=80=80=
=80=88=80=80=80=80=80=80=80=80=80=85

                =81   asio::post(request)        =81

                =81 =80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80>

                =81                                            =81

                =81   asio::post(response)     =81

                =81 <=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=
=80

     =82=80=80=80=80=89=80=80=80=80=80=83          =82=80=80=80=80=80=80=80=
=80=89=80=80=80=80=80=80=80=80=80=83

     =81MainThread=81          =81MRD_Handler_Thread=81

     =84=80=80=80=80=80=80=80=80=80=80=85          =84=80=80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=85



Based on the URI main thread decides to continue to process the request or =
offload it to the MRD handler thread.

The response received from the MRD thread is returned to the client by the =
main thread.
               The performance results with the solution are great. We see =
almost 50% improvement in the performance of power/thermal URIs.
               Here is performance is measured based on worst case latency =
seen on power thermal URIs when there are concurrent clients accessing powe=
r/thermal + MRD URIs.

               However, this solution seems to have some stability issues i=
n the overnight long run tests.
The crash is seen around boost:post APIs in multi-threading context. I have=
 logged a different bug in boost::asio to demonstrate this problem. https:/=
/github.com/chriskohlhoff/asio/issues/1352
I will follow up to check if boost can help us with this fix.

What I am looking for

  1.  Does anyone have any different proposal for sharing IO context betwee=
n threads which can work our bmc platform?
  2.  Feedback on handling dbus connection between multiple threads in the =
context of bmcweb?
  3.  Is this a good model to dedicate threads based on the use case as we =
are not able to make IO sharing between threads work well?
  4.  Any better way to Post asio jobs across threads and make it stable?

Thanks
Rohit PAI


--_000_LV2PR12MB601437AEF8603C553E64CB9CCDEEALV2PR12MB6014namp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:151877863;
	mso-list-type:hybrid;
	mso-list-template-ids:1159745606 -47515864 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1032731957;
	mso-list-type:hybrid;
	mso-list-template-ids:611251286 -1114587110 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1141731513;
	mso-list-type:hybrid;
	mso-list-template-ids:27537540 67698703 67698713 67698715 67698703 6769871=
3 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This previous <a href=3D"https://lists.ozlabs.org/pi=
permail/openbmc/2023-May/033495.html">
thread</a> captures the motive behind our interest in chasing multi-threade=
d solution for bmcweb.
<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks to Ed for putting up this initial patch. <a h=
ref=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/63710">
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/63710</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have been testing this patch in the recent times =
and I wanted to put a summary of our observations. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l2 level1 =
lfo1">The original patch was not creating any explicit threads and we did n=
ot find boost::asio creating them for us.
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">So as per this <a href=3D"https://theboostcpp=
libraries.com/boost.asio-scalability">
article</a> from boost I modified the patch to create a thread pool and sha=
re the same IO context among all threads. &nbsp;<o:p></o:p></p>
<p class=3D"MsoListParagraph">When I tested this change, I found two proble=
ms. <o:p>
</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l0 level=
1 lfo2">Sharing same IO context between multiple threads does not work.
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in">I have logged thi=
s issue &nbsp;<a href=3D"https://github.com/chriskohlhoff/asio/issues/1353"=
>https://github.com/chriskohlhoff/asio/issues/1353</a> &nbsp;in boost::asio=
 git hub page with sample code to reproduce the
 issue. <o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in">It would be great=
 if someone else test this sample code and share the results based on their=
 platform.
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l0 level=
1 lfo2">Sharing dbus connection across threads is not safe:
<o:p></o:p></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:.75in">when we share same IO co=
ntext between multiple threads, it&#8217;s possible that the async job post=
ed by one thread, can be picked up by some other thread.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.75in">If thread1 makes crow::c=
onnections::systemBus().async_method_call then the response lambda can get =
executed in thead2&#8217;s context.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.75in">When thread2 is trying t=
o read from the dbus connection, thread1 can make a new request on the same=
 bus connection as part of handling another URI request.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.75in">Sdbus is not thread safe=
 when connection object is shared between multiple threads which can perfor=
m read/write operations. &nbsp;<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:.75in"><o:p>&nbsp;</o:p>=
</p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l2 level1 =
lfo1">IO Context per thread.
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">Since sharing IO context was not working I to=
ok the second approach mentioned in this
<a href=3D"https://theboostcpplibraries.com/boost.asio-scalability">article=
</a> which is to dedicate IO context per threads.
<o:p></o:p></p>
<p class=3D"MsoListParagraph">Major design challenge with this approach is =
to decide which jobs must be executed in which IO context.<o:p></o:p></p>
<p class=3D"MsoListParagraph">I started with dedicating one thread/IO conte=
xt to manage all the incoming requests and handling responses back to the c=
lients.
<o:p></o:p></p>
<p class=3D"MsoListParagraph">I dedicated another thread/IO context to only=
 manage aggregate URIs which have 1K+ sensors response (MRDs) to populate a=
nd does not have tighter latency requirements.
<o:p></o:p></p>
<p class=3D"MsoListParagraph">Our goal is to have faster response on the po=
wer/thermal URIs which is served by the main thread and is not blocked by h=
uge response handling required by aggregate URIs which is managed by the se=
condary thread.<o:p></o:p></p>
<p class=3D"MsoListParagraph">From our previous performance experiments, we=
 had found that JSON response preparation for 5K+ sensors was taking around=
 250 to 300ms in bmcweb during which power/thermals URIs were blocked. &nbs=
p;<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp; =82=80=80=80=80=80=
=80=80=80=80=80=83&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=82=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=83<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp; =81MainThread=81&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =81MRD_Handler_Thread=81=
<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp; =84=80=80=80=80<span=
 style=3D"font-family:&quot;Arial&quot;,sans-serif">=88</span>=80=80=80=80=
=80=85&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=80=80=80=
=80=80=80=80=80<span style=3D"font-family:&quot;Arial&quot;,sans-serif">=88=
</span>=80=80=80=80=80=80=80=80=80=85<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp; asio::post(re=
quest)&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81 =80=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=81&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp; asio::po=
st(response) &nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81 &lt;=80=80=80=80=80=
=80=80=80=80=80=80=80=80=80=80=80=80=80=80&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o=
:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=82=80=80=80=80=
<span style=3D"font-family:&quot;Arial&quot;,sans-serif">=89</span>=80=80=
=80=80=80=83&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =82=80=
=80=80=80=80=80=80=80<span style=3D"font-family:&quot;Arial&quot;,sans-seri=
f">=89</span>=80=80=80=80=80=80=80=80=80=83<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp; =81MainThread=81&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=81MRD_Handler_Thread=81=
<o:p></o:p></p>
<p class=3D"MsoListParagraph">&nbsp;&nbsp;&nbsp;&nbsp; =84=80=80=80=80=80=
=80=80=80=80=80=85&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=84=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=80=85 <o:p>
</o:p></p>
<p class=3D"MsoListParagraph">&nbsp;<o:p></o:p></p>
<p class=3D"MsoListParagraph">Based on the URI main thread decides to conti=
nue to process the request or offload it to the MRD handler thread.
<o:p></o:p></p>
<p class=3D"MsoListParagraph">The response received from the MRD thread is =
returned to the client by the main thread.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The performance results with the solution =
are great. We see almost 50% improvement in the performance of power/therma=
l URIs.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Here is performance is measured based=
 on worst case latency seen on power thermal URIs when there are concurrent=
 clients accessing power/thermal + MRD URIs.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;However, this solution seems to have =
some stability issues in the overnight long run tests.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">The crash is seen around =
boost:post APIs in multi-threading context. I have logged a different bug i=
n boost::asio to demonstrate this problem.
<a href=3D"https://github.com/chriskohlhoff/asio/issues/1352">https://githu=
b.com/chriskohlhoff/asio/issues/1352</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">I will follow up to check=
 if boost can help us with this fix.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What I am looking for <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l1 level=
1 lfo3">Does anyone have any different proposal for sharing IO context betw=
een threads which can work our bmc platform?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:.25in;m=
so-list:l1 level1 lfo3">Feedback on handling dbus connection between multip=
le threads in the context of bmcweb?<o:p></o:p></li><li class=3D"MsoListPar=
agraph" style=3D"margin-left:.25in;mso-list:l1 level1 lfo3">Is this a good =
model to dedicate threads based on the use case as we are not able to make =
IO sharing between threads work well?<o:p></o:p></li><li class=3D"MsoListPa=
ragraph" style=3D"margin-left:.25in;mso-list:l1 level1 lfo3">Any better way=
 to Post asio jobs across threads and make it stable?<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB601437AEF8603C553E64CB9CCDEEALV2PR12MB6014namp_--
