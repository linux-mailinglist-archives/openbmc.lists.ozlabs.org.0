Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA61EB21D
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 15:06:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473nDy48RbzF3bS
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 01:06:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stratus.com (client-ip=216.205.24.131;
 helo=us-smtp-delivery-131.mimecast.com;
 envelope-from=mohsen.dolaty@stratus.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stratus.com
X-Greylist: delayed 65231 seconds by postgrey-1.36 at bilbo;
 Fri, 01 Nov 2019 01:01:09 AEDT
Received: from us-smtp-delivery-131.mimecast.com
 (us-smtp-delivery-131.mimecast.com [216.205.24.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473n6Y4JQQzF5mL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 01:01:05 +1100 (AEDT)
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2057.outbound.protection.outlook.com [104.47.32.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-E79DsmrvOi-hZDpnEufR7w-1; Thu, 31 Oct 2019 10:00:55 -0400
Received: from CY4PR08MB2981.namprd08.prod.outlook.com (10.173.61.146) by
 CY4PR08MB2472.namprd08.prod.outlook.com (10.168.169.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Thu, 31 Oct 2019 14:00:54 +0000
Received: from CY4PR08MB2981.namprd08.prod.outlook.com
 ([fe80::40b0:d709:3f2d:4559]) by CY4PR08MB2981.namprd08.prod.outlook.com
 ([fe80::40b0:d709:3f2d:4559%11]) with mapi id 15.20.2387.027; Thu, 31 Oct
 2019 14:00:54 +0000
From: "Dolaty, Mohsen" <Mohsen.Dolaty@stratus.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: AST2500 Evaluation Board build question
Thread-Topic: AST2500 Evaluation Board build question
Thread-Index: AdWP82PuveP5ZS5NTMa/rZxPq/TNzg==
Date: Thu, 31 Oct 2019 14:00:54 +0000
Message-ID: <CY4PR08MB2981B0B9732CDB1E0F15DC2BE4630@CY4PR08MB2981.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [198.97.42.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 745bcf10-34b5-420b-cce3-08d75e0abf24
x-ms-traffictypediagnostic: CY4PR08MB2472:
x-microsoft-antispam-prvs: <CY4PR08MB24726B7B5DFF450E96C616C6E4630@CY4PR08MB2472.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02070414A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(39850400004)(136003)(346002)(199004)(189003)(40764003)(174874002)(7696005)(5660300002)(790700001)(71200400001)(8676002)(316002)(55016002)(33656002)(54896002)(14454004)(8936002)(486006)(9686003)(6306002)(2351001)(3846002)(1730700003)(81166006)(476003)(81156014)(6116002)(71190400001)(66476007)(86362001)(66556008)(66446008)(76116006)(2501003)(66946007)(256004)(478600001)(5640700003)(2906002)(74316002)(6916009)(52536014)(64756008)(6436002)(25786009)(6506007)(66066001)(99286004)(102836004)(26005)(186003)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR08MB2472;
 H:CY4PR08MB2981.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LLNqLiyoBphajKhjmSvEjpdQzEhBLS7Vcu0XWSw3D7EJ6jFwO0PfXBZi/8mjm2DWM1xd6bgjUsbzXE7soMqfYHVUnDrc7qGvPEzOrL6lTPe9S1snshKZU9H9bj2wNt7abuq0qi964m6x4rG/dwYxu0nMwCrtoPMoLSvrG4tJfMycgbhFt9DC44I11JmUnS5Dl7MLKRGHzmrhHCTlHdz+ZuAGrltdsZQ2TMxdSakq+jfvSxGis3sO600Am5/N12XRMZrfwT0seoS37aqt2NsCp86ar6+O9yts1xcR1OdY1vTfyRWNKOLOUrKce+F+whZZy8pvFbtckfBQbW5uUsbl27YcHr6H6HuCxpkD/QNSjaVKXaxS3BYZmpxw79M75ZD8fP0stSmG467iwCR8rrgPgzQFb/tDXWuqcPBhgBjShOTgrJatnBQDJoPck6i6DYD4
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: stratus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745bcf10-34b5-420b-cce3-08d75e0abf24
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2019 14:00:54.4029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de36b473-b8ad-46ff-837f-9da16b8d1b77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSiRI1A0OZ/ztNtpEUmcMlQM8Selg86KMZxvnDX4m5e58+s5eUTW+vbrKkhm0AUoff0HMSBUafqwKnTIn76mkxD/6TVwJU242zTs+m2p75g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR08MB2472
X-MC-Unique: E79DsmrvOi-hZDpnEufR7w-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative;
 boundary="_000_CY4PR08MB2981B0B9732CDB1E0F15DC2BE4630CY4PR08MB2981namp_"
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

--_000_CY4PR08MB2981B0B9732CDB1E0F15DC2BE4630CY4PR08MB2981namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

We have started working with OpenBMC for AST2500.
We have a AST2500 evaluation board.
We are using recommended build environment and setting:
               export TEMPLATECONF=3Dmeta-evb/meta-evb-aspeed/meta-evb-ast2=
500/conf
We are using bitbake to build phosphor image:

. oe-init-build-env
bitbake obmc-phosphor-image

The final image is in:
openbmc/build/tmp/deploy/images/evb-ast2500

We put the following image (about 7.5 MB) in our TFTP server
                fitImage-aspeed-image-initramfs-evb-ast2500--5.3.1+git0+3ad=
520f93d-r0-evb-ast2500-20191030145446.bin -> evb.bin

and then from uboot we can:
                dhcp evb.bin
bootm

System boots and we can log in as:
root
0penBmc

But we only get a minimal OS.
There are no OpenBmc features (such as ssh, web server, ipmi stack, etc) in=
 this final image
What are we doing wrong?

We also get the following tar file:
                obmc-phosphor-image-evb-ast2500-20191030145446.rootfs.tar.g=
z

When we open the tar file, all these services are in /usr/bin of the tar fi=
le.
But they are not in the /usr/bin file we loaded to AST2500 evaluation board=
.

Thanks for your help

-Mo

--_000_CY4PR08MB2981B0B9732CDB1E0F15DC2BE4630CY4PR08MB2981namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">We have started working with OpenBMC for AST2500.<o:=
p></o:p></p>
<p class=3D"MsoNormal">We have a AST2500 evaluation board.<o:p></o:p></p>
<p class=3D"MsoNormal">We are using recommended build environment and setti=
ng:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export TEMPLATECONF=3Dmeta-evb/meta-evb-as=
peed/meta-evb-ast2500/conf<o:p></o:p></p>
<p class=3D"MsoNormal">We are using bitbake to build phosphor image:<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">. oe-init-build-env<o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">bitbake obmc-phosphor-ima=
ge<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The final image is in:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.0pt;font-family:Consolas;border:none windowtext 1.0pt;padding:0in">openb=
mc/build/tmp/deploy/images/evb-ast2500<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.0pt;font-family:Consolas;border:none windowtext 1.0pt;padding:0in"><o:p>=
&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
;border:none windowtext 1.0pt;padding:0in">We put the following image (abou=
t 7.5 MB) in our TFTP server<o:p></o:p></span></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fitImage-aspeed-image-initramfs-evb-=
ast2500--5.3.1&#43;git0&#43;3ad520f93d-r0-evb-ast2500-20191030145446.bin -&=
gt; evb.bin<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">and then from uboot we can:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dhcp evb.bin<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">bootm<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">System boots and we can log in as:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">root<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">0penBmc<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But we only get a minimal OS.<o:p></o:p></p>
<p class=3D"MsoNormal">There are no OpenBmc features (such as ssh, web serv=
er, ipmi stack, etc) in this final image<o:p></o:p></p>
<p class=3D"MsoNormal">What are we doing wrong?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We also get the following tar file:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obmc-phosphor-image-evb-ast2500-2019=
1030145446.rootfs.tar.gz<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When we open the tar file, all these services are in=
 /usr/bin of the tar file.<o:p></o:p></p>
<p class=3D"MsoNormal">But they are not in the /usr/bin file we loaded to A=
ST2500 evaluation board.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your help<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Mo<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY4PR08MB2981B0B9732CDB1E0F15DC2BE4630CY4PR08MB2981namp_--

