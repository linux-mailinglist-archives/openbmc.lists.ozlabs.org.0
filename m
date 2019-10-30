Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB1EA7EC
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 00:57:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473QPY4K54zF49G
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 10:57:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stratus.com (client-ip=63.128.21.131;
 helo=us-smtp-delivery-131.mimecast.com;
 envelope-from=mohsen.dolaty@stratus.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stratus.com
Received: from us-smtp-delivery-131.mimecast.com
 (us-smtp-delivery-131.mimecast.com [63.128.21.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473QNm2D5rzF3fk
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 10:57:05 +1100 (AEDT)
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2050.outbound.protection.outlook.com [104.47.40.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-HUlLSaPjP0mMW-IAhOajQQ-1; Wed, 30 Oct 2019 15:53:48 -0400
Received: from CY4PR08MB2981.namprd08.prod.outlook.com (10.173.61.146) by
 CY4PR08MB3607.namprd08.prod.outlook.com (10.171.253.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.18; Wed, 30 Oct 2019 19:53:44 +0000
Received: from CY4PR08MB2981.namprd08.prod.outlook.com
 ([fe80::40b0:d709:3f2d:4559]) by CY4PR08MB2981.namprd08.prod.outlook.com
 ([fe80::40b0:d709:3f2d:4559%11]) with mapi id 15.20.2387.027; Wed, 30 Oct
 2019 19:53:43 +0000
From: "Dolaty, Mohsen" <Mohsen.Dolaty@stratus.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: AST2500 Evaluation Board build question
Thread-Topic: AST2500 Evaluation Board build question
Thread-Index: AdWPWm4vkjUYGK32TmqmWMKqWkOolA==
Date: Wed, 30 Oct 2019 19:53:43 +0000
Message-ID: <CY4PR08MB2981ECAA6C301A1E9C413909E4600@CY4PR08MB2981.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [198.97.42.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58be3016-a679-479f-54f8-08d75d72de99
x-ms-traffictypediagnostic: CY4PR08MB3607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR08MB36077BCD3D32A169C3D4D98EE4600@CY4PR08MB3607.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(376002)(396003)(39840400004)(40764003)(174874002)(189003)(199004)(26005)(86362001)(71200400001)(2501003)(66446008)(66556008)(66476007)(52536014)(66946007)(64756008)(71190400001)(76116006)(6506007)(7696005)(476003)(102836004)(6916009)(2906002)(256004)(14454004)(486006)(74316002)(8936002)(316002)(4326008)(8676002)(107886003)(33656002)(478600001)(81156014)(6116002)(81166006)(25786009)(7736002)(1730700003)(66066001)(55016002)(5640700003)(186003)(9686003)(6306002)(5660300002)(54896002)(6436002)(2351001)(99286004)(3846002)(790700001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR08MB3607;
 H:CY4PR08MB2981.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VvAvI3a8R7W950bY8D7FxaOfKfi2KHXD5nyDq6BEmYcPiolIY+w24oKLS8OHLdCbR6yXewok+vpw6psZkGJnpVHRDARynPxOF6vkt4GB6OO5JdZtjHZouPf8S4vssjtW46AfnwHD71rozZ4EKfS34gI89zeB53TyUEiBR2W2r6L/3bccpXdGPm9tpdF57cilc1lIpCvGNPg7FOcXoQxKHTfHlyXuzu8JKvvczLpx1EmW4zZ2MjTYvLuxPLocwybKVIZikq8j/vmctea39Jgv4wAgnEv9mU33Ow/uaFQb4kU5FaSevzhT/EffL6ohAXgX8jNm6vGW+swoIOpsWxPJIXvaMpj9l1E34GWVakxPsNkKSKa4VDSEBhj7YaTZnL4uikInzEzXFBI23der+FqiQFx/RHgAu1iaS0qsIEYah1ut/dEtFf0n+TWmOZ2wxnrr
MIME-Version: 1.0
X-OriginatorOrg: stratus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58be3016-a679-479f-54f8-08d75d72de99
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 19:53:43.6920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de36b473-b8ad-46ff-837f-9da16b8d1b77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CG3EMYDHR2f3jGzw6JxIso9kBEjIeem7B1jY5hTf9D4Ou7649WSl1WzjYYXX9f9MZF+H8VaJXuG7rENLaRMw73AFpZZE5VMO8R5B+Qdpa3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR08MB3607
X-MC-Unique: HUlLSaPjP0mMW-IAhOajQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative;
 boundary="_000_CY4PR08MB2981ECAA6C301A1E9C413909E4600CY4PR08MB2981namp_"
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
Cc: "Rice, Don" <Don.Rice@stratus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CY4PR08MB2981ECAA6C301A1E9C413909E4600CY4PR08MB2981namp_
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

The final image wis in:
openbmc/build/tmp/deploy/images/evb-ast2500

We put the following image (about 7.5 MB) in our TFTP server
                fitImage-aspeed-image-initramfs-evb-ast2500--5.3.1+git0+3ad=
520f93d-r0-evb-ast2500-20191030145446.bin

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
But they are not in the bin file we loaded to AST2500 evaluation board.

Thanks for your help



--_000_CY4PR08MB2981ECAA6C301A1E9C413909E4600CY4PR08MB2981namp_
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
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:8.0pt;
=09margin-left:.5in;
=09mso-add-space:auto;
=09line-height:106%;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParag=
raphCxSpFirst
=09{mso-style-priority:34;
=09mso-style-type:export-only;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09line-height:106%;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListPar=
agraphCxSpMiddle
=09{mso-style-priority:34;
=09mso-style-type:export-only;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09margin-bottom:.0001pt;
=09mso-add-space:auto;
=09line-height:106%;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagra=
phCxSpLast
=09{mso-style-priority:34;
=09mso-style-type:export-only;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:8.0pt;
=09margin-left:.5in;
=09mso-add-space:auto;
=09line-height:106%;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
=09{mso-list-id:218562709;
=09mso-list-type:hybrid;
=09mso-list-template-ids:485365984 67698689 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
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
<p class=3D"MsoNormal">The final image wis in:<o:p></o:p></p>
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
ast2500--5.3.1&#43;git0&#43;3ad520f93d-r0-evb-ast2500-20191030145446.bin<o:=
p></o:p></p>
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
<p class=3D"MsoNormal">But they are not in the bin file we loaded to AST250=
0 evaluation board.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your help<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY4PR08MB2981ECAA6C301A1E9C413909E4600CY4PR08MB2981namp_--

