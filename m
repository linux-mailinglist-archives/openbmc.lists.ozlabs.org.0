Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C957573E
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 23:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkStL0NZCz3c5f
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 07:53:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=iL7eRQ2H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=40.107.94.103; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=arvindna@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=iL7eRQ2H;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2103.outbound.protection.outlook.com [40.107.94.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkSst1jFjz2x9T
	for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 07:53:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa2VTsEdN3JAmA7lDwKlW9f7b3jb2ST7GMlSEIRUvC0lOVXvo8AJCqR517SFCyG3bCgrtOIcKHzfympI+LchL8j+maZc+NkKuulr60W+ervfCfhVJdjjfwf5gMLYoswiLnA3LPEg1z2niNyb8kX3ZK8+kewjeW8wwu4dc+nM8QCqGOb0rBiagW7o/kRlpjtYgAdEns4OZxQ1JMGR23f5DIPHy2VTnI2spWHH/r4QCbGvNsuoYR4njLKYRFUSWaxCzs71Fp4xmhpHutrk0uICXVFK949rAqRS1Vee4buOCAGvswigzux6pUpz9VbQxIq0O6Tely54LPBz5UaTSYNTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkxxmPG7zlbr1Ps4ybpzNBrTIkZiRlN7PxZMwyccibM=;
 b=dyC3SgmXssLcXSWdHxu87ugB8+Us2jVbyeB2ZlPM5dbK52eNa9nx9A/P3+3olNrO/LdqV+nKjs6WSLyaXBSgTcqy+0aI+zIsxkgVuC4QWvZXGdJxwaoxEmP9x9Qj/4pI2u0uawGPmO/UgSmu5TELRQCN0Cj0NFPqDw5mr2n7WNzLfSrL90g0vLD3Vx9NdOWBXFTBNbE5HzU5kTbceH9BNz8u2t2wVArvv3YLm93XGjaYIMl1xmUKMNpTOdXcJqhmTB8CYlMn8Le7RCqc2/kvv6G3v6eXqka8LRwIRa5gSA+jg/f7VyMeMmh0tMbdYWPuhEtkkO82yh3d+zX31WkFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkxxmPG7zlbr1Ps4ybpzNBrTIkZiRlN7PxZMwyccibM=;
 b=iL7eRQ2HNoaJmpDnTY9cG2u9zv+YC64UQQYE/rRlO8kk+/Sy+ZTBJZkd7dIOEo2woluVtuMapCg96BZLqlo1jPIKl4SqqXCm/9qENLKkuhBuoT1YiMNAGshMekEXPIwnyl1TcnnKDlYrGzwEePRStTySnx/pN45SrwB+CBrZn28=
Received: from MN2PR21MB1184.namprd21.prod.outlook.com (2603:10b6:208:38::15)
 by SA1PR21MB1317.namprd21.prod.outlook.com (2603:10b6:806:1f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.10; Thu, 14 Jul
 2022 21:52:58 +0000
Received: from MN2PR21MB1184.namprd21.prod.outlook.com
 ([fe80::853b:2fdf:911c:bae8]) by MN2PR21MB1184.namprd21.prod.outlook.com
 ([fe80::853b:2fdf:911c:bae8%5]) with mapi id 15.20.5458.010; Thu, 14 Jul 2022
 21:52:57 +0000
From: Arvind Nandanahosur Ramesh <arvindna@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Extending phosphor-gpio-monitor to expose gpio objects on dbus
Thread-Topic: Extending phosphor-gpio-monitor to expose gpio objects on dbus
Thread-Index: AdiXzA4VNB77pjd7Rh6NqdUNlePIsQ==
Date: Thu, 14 Jul 2022 21:52:57 +0000
Message-ID:  <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d19094cf-7876-456d-8806-37626ed6c790;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-07-14T21:50:52Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77a6acfd-d900-44b2-5f15-08da65e336e2
x-ms-traffictypediagnostic: SA1PR21MB1317:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VEh5+910xL+tyI/8n3pHegfxa8JH3v2te1HpOmHixpgD0spEn9ktOr1hpqGsQ6O8khvE/15Q4Tp9x9LYtUujNX0BDoheKi3EKeelP+U/4rIC1UyWpJ5QrQXKEMNsYknHPlq6F4LKd0SEk8ZI60p+9UrLUf3VHXL6Pvu9ooIG0dnBpTz1NzQGS1enl5mEZPF+jbat0ELJnpTC0Gg+DI05dGJP5GhbK0AQ2UuWnLoP4CUxWxRykYX4HsRPfm9EYdiiHWotqm6HYoezHKLdal4ifdn8q8nOWJuDfUr5lbDexuFa8SKYjlDKD493nTEGaO7UZ/N2ApQeMf8L5XKbIrs5RVjYeYNpm9WhcBUo+lBiJzVNl/DKGo9XJ9yneBYG0owC6osZVtgwsYqTJb/7TJy8HNXak835vQlpsKoIf0lZKIQu6BTkh+zU3Es1j1mG4Ox3jGyhGik3JtmOVk/eVtaulU7YJxpe6rkmIdRVLvRvKo0ZHlWNyODsNpRIbUMxijvrc69qNO1i7I5+K9s40W+gzhJskbrmTkFyKYsosQojWODBckQPE1xI9yhjXR6JgQ6vcv4Ra15vRFP75E+mBP+GA6YZ99wXXSj2HawxUOvTg994Q4mcsZyu4b5Z+7mEp1DVgNkT1PMjTCP4ydAIOYcfigfotUj4f637Tjrv9WkErl8363aethJXpCX1GXd7wz+yWeytQ1soU8pSGCrWkIzQ/u6DPvdOY0bcm1BrPQL57f4vYPGellyaS533kqMBiL0oGA58TTJ+NKXYVOmsQTHAbmbyoyZc5Muwmp+8VoaAliczkYq7uG77R3d5z+CS4xJPqxnEksVlLt6tNPAfdxG1gT/53Ut8HtkuXEdKg1w6hWmfHW1uMUkJwwsQvB4ThmnU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR21MB1184.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199009)(41300700001)(7696005)(6506007)(2906002)(5660300002)(55016003)(9326002)(8936002)(52536014)(9686003)(8990500004)(478600001)(122000001)(38100700002)(66556008)(8676002)(64756008)(66446008)(76116006)(66946007)(82950400001)(6916009)(316002)(71200400001)(10290500003)(186003)(4744005)(38070700005)(33656002)(66476007)(82960400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?SqAT0t95gGJsa+SCYPn4UuV1AoCQ7tm0oOX4PKrWv1h8KB4i18V0s9SQlkkc?=
 =?us-ascii?Q?Gwe0A7JOHGinuC+EGhl2vKw1ojgNYQkLAZ31RhGH2Qd0BJcqL+zxD+AjqjPt?=
 =?us-ascii?Q?b/tYPbAVPsjWJ76kh6aA5FoPH+l/lRdP7fwCliMrv0CnhSD+K/7lHl0LR+2S?=
 =?us-ascii?Q?90Lpf5edofCIUDHCp0N8dJvzqOtQ67OkaQQybkibgmZBK2DakcBbdoa1Yl7E?=
 =?us-ascii?Q?r9+9llbo+3Pbwslt3+OLciBdcWVE3x+CVtHx27xX582HhlVANh2hwuTYJLav?=
 =?us-ascii?Q?Kge9Z1241KD/Q6kXixcOdxTWeT2tifEdQJzHAa69wXxEDsWFL26QUz6BDpHh?=
 =?us-ascii?Q?CzRajWN6ozwrjShQYq01LHq45oLjsqQT4bQCAHoOp9Gv4P1xMMMukyCAhk7E?=
 =?us-ascii?Q?q5ra3tJYFQeWsvm1qrfzMrhnbZxLfGKl3n9dE3H2vudckVHbAZRtYL2K/VYr?=
 =?us-ascii?Q?F4pctoTow9qsJtQPg9MeLQJ8IHFUBXOyGFs3OmpDjOUdNdxGn1otXC3vdNss?=
 =?us-ascii?Q?8c6vSuW8cuwOrxrtJ1BwsPZ1ckJ7w+G4Ybwsn4TAtgL3X/+rivQUqIOPsW7e?=
 =?us-ascii?Q?7UQEnC2loAeFxpYN2HT4T0aodVkmE8HGtZO1C9XZAq7uqvRUlwG+CSazT0m9?=
 =?us-ascii?Q?OlTDo8CMsU2xU/nFcEtQh/jxpMvdCWr7aYqeDtengTLrPWSbAX6hQ8k8i1L6?=
 =?us-ascii?Q?8eBCpHR131/3Bc+bHAzNeKedduo7izEwEY1y4nwmuDtZyXdM/HE+J4Nd+3Nv?=
 =?us-ascii?Q?6AlecyHx79U1Qn7xiJcnJaH0pow4xdka0+/b5SCGA0KTrOowD+zlScvFV0Aa?=
 =?us-ascii?Q?45ouYkhWuAtlK6Klyyyml/bYlZrJm+8K0y9CxpOHRpIqbQMge0xgTczWS3cs?=
 =?us-ascii?Q?jjfzqWKBUTr9Vwezhh74gRezihvic0MiiMdcoOC/Et/sns3/RcwG1LhlJKVv?=
 =?us-ascii?Q?BMNvV9J5exIFo9oexI0F4Gcu4lfCL4Zol7FS/ThIeLEkW8SIpgX8N6kJrHm9?=
 =?us-ascii?Q?J4kFxFbz95Y+5poo/kAnIPpu3P4gQi334+p0/zqN8Bi2t234/gH1kf7mrADV?=
 =?us-ascii?Q?t/Vc/UMgNkF3AYl4cUDbt0QQxc090qP+k+YN5btBPAYSchBBgWyb2jPGvLrM?=
 =?us-ascii?Q?Ew9wmK8gwEzDWE7f2TEsqbdroOYdkm3oabuLnrXD0pbLvKxwpyLIH1SrUj95?=
 =?us-ascii?Q?rnLCr4JKh+ng5St4+TJsXJbVPm5A0z1Lswi69WlhVXcr8q+3nVTgysV/UqK8?=
 =?us-ascii?Q?DP1lUtrJWfllKrnqI27oI8vFCBD2XWvMsUGg5ySJLaVs0omSLbGVJhtiOtEq?=
 =?us-ascii?Q?JtcmihMxvmDxIh5iPoOdrO/uhoUPEb313DPCLqv5vBmpqPU2Eby9oWuDMZSd?=
 =?us-ascii?Q?OPedv7UJVSJNaMGlIkhrte77joA+C2+fJcyH/6JZxu/LLiTIUxTlYcAM4LyW?=
 =?us-ascii?Q?DnrAdD+hZYOkdQUXjpkBWqtFDCccLv9yM07UiOPt7Epf5sMf9gTgTwa0FAjX?=
 =?us-ascii?Q?UYP0xrqNrcLEjW91wFxJsOuLjhQhcXw0g1DZ3eWo+Ju3nSH8PLigAG68mPHa?=
 =?us-ascii?Q?0w635ySlb3JmM8ECebf/Fak3Jsn78IX7LGfW7dfh?=
Content-Type: multipart/alternative;
	boundary="_000_MN2PR21MB118426E5D86B645A1ADF887AC8889MN2PR21MB1184namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR21MB1184.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a6acfd-d900-44b2-5f15-08da65e336e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 21:52:57.8820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BaeV5aTapL4DRwDPlU4E5PJVj1DBCYPYE95WXIV39op0Fx73U8l27BgV+LicSQBqcqUrwfEv+dDx34aaiLE6OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB1317
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

--_000_MN2PR21MB118426E5D86B645A1ADF887AC8889MN2PR21MB1184namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

We have been toying with the idea of extending the phosphor-gpio-monitor to=
 expose the the gpio objects it manages on dbus in addition to its current =
functionality of executing a specified systemd target. This additional func=
tionality can be enabled by an additional parameter in the phosphor-multi-g=
pio-monitor.json file. Before going down the path of implementing this and =
upstreaming the changes, I wanted to get a sense on if this is a good or a =
bad idea. Essentially this would be useful for other services to query the =
current GPIO value of input signals over dbus or react to changes in its va=
lue. What did you all think ?

Thanks
Arvind


--_000_MN2PR21MB118426E5D86B645A1ADF887AC8889MN2PR21MB1184namp_
Content-Type: text/html; charset="us-ascii"
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
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
<p class=3D"MsoNormal">Hi Everyone, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have been toying with the idea of extending the p=
hosphor-gpio-monitor to expose the the gpio objects it manages on dbus in a=
ddition to its current functionality of executing a specified systemd targe=
t. This additional functionality can
 be enabled by an additional parameter in the phosphor-multi-gpio-monitor.j=
son file. Before going down the path of implementing this and upstreaming t=
he changes, I wanted to get a sense on if this is a good or a bad idea. Ess=
entially this would be useful for
 other services to query the current GPIO value of input signals over dbus =
or react to changes in its value. What did you all think ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Arvind <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MN2PR21MB118426E5D86B645A1ADF887AC8889MN2PR21MB1184namp_--
