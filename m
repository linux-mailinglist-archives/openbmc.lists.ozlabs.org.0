Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D05EB509
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 01:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbyxc19plz3c6X
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rOZQK+Hq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.98; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rOZQK+Hq;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2098.outbound.protection.outlook.com [40.107.95.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbyx41vwWz3bXg
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 09:03:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKmonJxCEakmVRAaw6u3VBuYJB7wx8z+kiSh38Zy5Z07ulehspU32y6N4cK4itfm2RZzzX4gFH4zA/DhVmUWJWlL065jbB9A3rDSMK3t6xYBVUAiQTSZaz1DMHwD6fXHtBhfNKpvjB9y4rrn6NfQ59XP5ezLG1ABoECRxLlPGImuK7I15bSr9opKW0hDyP2uZaDPBsoz0OAphYiZQ/d6DfKXeShlYjaVvsR0GGPE+EMPxLoHzWnS8tRtd9+HMz5l+hqHPrwFA9543pDA6A63bxrMcZVMrlRcjOHgs23Tg0arHQzywCnAlbZOVDXSrJTcYNunzeKjYFh8Jb4CuUiIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw/SzYlWZF1kwqQ0mlNIMuYLbU1LON4J8iXdlJ+7kiQ=;
 b=epqIu4rkZ9p3AzLPqGBzv1tT+GHAOZglTYexgaqPWBeKzQ2LSRt5W0NXaw3W+yl+/yVnG+pwHS7Y5+jqIJ1VwuHqXieXhvXe+f4ZoG2Ah/Ht3N6km+PZBmF4MoHo6PQT/9WNP79aB38XOGyC+85B4yyTDXskTh4Gct7EhYhRL0hywC2PNpo7EsGxMI0TqI2iofv8hF3eqkLu1wi2oLLKqRBpF9cOSM1qprf5KdcCplPtLeiv5VFiWkLD/bmJJ/btlGIlpDwHQEnRt2541g5EDnzg3L4lPg8zmXt0IaVWWFRnD8JmlXeiKqsiP+KD5Z/kiVH9QslglYAMxpkgR8hNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw/SzYlWZF1kwqQ0mlNIMuYLbU1LON4J8iXdlJ+7kiQ=;
 b=rOZQK+HqkjRUM0Dhdbzk3T3aFa76lx2VZW+Ii6OvpvdiXhyT5nj/KBn8jfugOEGvLea4Aw9coh2Ffmw3niAV+6X0j6u6JCq2GIU2EKa2fYOgeQ0sAxRKirPT57aVde0BHrdWHco5/0uSHclpCNx2NWYlnYt5GytIhkIYpKNnY5w=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 BY5PR01MB5828.prod.exchangelabs.com (2603:10b6:a03:1c1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.18; Mon, 26 Sep 2022 23:03:42 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::bee6:a254:ca41:8dd3]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::bee6:a254:ca41:8dd3%3]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 23:03:42 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: Patrick Williams <patrick@stwcx.xyz>, Naveen Moses
	<naveen.moses@hotmail.com>
Subject: Re: phosphor-buttons multihost control
Thread-Topic: phosphor-buttons multihost control
Thread-Index: AdjRdcKJGsF9EAzNTg6iwgzCmANqtgAO7c+AAATPb4AADdA2sw==
Date: Mon, 26 Sep 2022 23:03:42 +0000
Message-ID:  <BL1PR01MB7747F58204241D07F2E006058D529@BL1PR01MB7747.prod.exchangelabs.com>
References: <000001d8d178$845d0900$8d171b00$@inventron.com.tr>
 <HK0PR04MB3236B36A4CDA767F59DB290891529@HK0PR04MB3236.apcprd04.prod.outlook.com>
 <YzHSr0DUdjHpCtnm@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YzHSr0DUdjHpCtnm@heinlein.stwcx.org.github.beta.tailscale.net>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Enabled=True;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SiteId=3bc2b170-fd94-476d-b0ce-4229bdc904a7;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SetDate=2022-09-26T23:01:54.0235085Z;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_ContentBits=0;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|BY5PR01MB5828:EE_
x-ms-office365-filtering-correlation-id: 0b071071-0a39-4228-d427-08daa0135b7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5l1kXnab3XxF2D56WnDjyUtU3vzW8v16Mqx55A4WwZcep5m1OemPeeecX9ojnS26IAfb9hKEZ5s7MGP68CUxevSovT4+hHTjugrgk4H+pbC9xMlKWsjOzc36RuLPJJkD4LW6+sakGF+cIK9aEbzP+7DTH9g8PhUAd9P1bhEJdIp5daZcSHy6bScfVLFqDM2Cbf10kB2wy9cMtdnybFMvBZaGvZg11aXuk2M04RBBJWbRJ8xhpOkagAsM2h+y2CmuUU7ZpdhLn75r3gNvrp1UvWULqwCCzcsUKEYngcaRxyVin52oDNqyGRAcHedo1Q14EUhYlACOQU0d8D2E5WZe2HwZ+bX3QIY9FEOfx/WNf2LtZThfUNwzbAsVlTd8N06mz/QL7ngDoWBfQuA0Iink6FlYQliy2zAS6CXo8PqQ+btxslkpzv+20xYihjCGRtdW0wWe0kjVcOXwcamVKSrUi70XIssskvw/nDXABrIMporxWfT1W42rIVOaU8YMkM5RgK5sdru1I1gDpq0f7kdc5NFy7RCPURiDoFosuQw0ZyvCxyPwGiMcz0b0CAMb+UMjQe37rZC5xEYmaExl+4xEU1+ghAHF+VrEBSsTlAgiJilaoedWHkqFbprCl2ArN8QkBx6ufhY/G27vfQBcTJadrxQDn5gR7c20u/sgBaDbzN+ZcQmSoQJMMuKdqw6NQCD/kA/DJ9jB98StZM1SdRSf306iDzvepUhaLKAu9qklGoykCINkhb6zIdpeZa9iz+zlDZ2ClYF+TSUCvViK3qglN7df6NnkE/4LOOPmnpJ/7pc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(39850400004)(136003)(376002)(451199015)(66446008)(76116006)(66556008)(2906002)(122000001)(66946007)(64756008)(8676002)(4326008)(5660300002)(8936002)(33656002)(110136005)(38100700002)(86362001)(52536014)(38070700005)(66476007)(9686003)(166002)(7696005)(53546011)(54906003)(26005)(186003)(41300700001)(966005)(478600001)(71200400001)(3480700007)(6506007)(45080400002)(91956017)(316002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?VAOxxeGzWycmOy9Zdb6f37BELz7YxoZWdB1+6hBqaVUde2SzxrhydiSkp+UY?=
 =?us-ascii?Q?yDU7S3Js3r93/UafngNuQPqc6n/1ZCiDubVUvN/ahdbs62oVKPyLkEYr6/g2?=
 =?us-ascii?Q?2QwzwSP6UVCqJmQMneKRwVi2/ZjaFZcnY7ib3v2x6eqxxwxe0f7whi1VNu1P?=
 =?us-ascii?Q?LWMDA1eYSHgFJCEGXEcr+Y+44Zm0YXP+v5Scl3Q0VhXzL23HEZcomUOCNmPK?=
 =?us-ascii?Q?05P3inK3RGHIeB2zTbmQjvuXVR+8rCdgmss0Jur+Ph+fy4UjrrY3M7Vf2fuE?=
 =?us-ascii?Q?BcnMthBUrPIYjJeYB1VkZBKW1aVrsab+SoTcqtyjrkk2GvD5zePu4M3KLpjJ?=
 =?us-ascii?Q?7dpIhstg30jBwHPONiKAAxl+9nXI2gCBljHLkM9CfXI5HN+9dkMGN0jUdV9P?=
 =?us-ascii?Q?i31EyO2BUIpg/cxOYpQbb8DoFXS+KbfRIylFtDZzDcsqNpYD4HoWRw/Kf3tx?=
 =?us-ascii?Q?kOC8wiUv8S3SQdBswU/dC2slFbGHwqF/ZcSZLBdeeJCtMVLS8z2fRjs2fzE6?=
 =?us-ascii?Q?iKi/4Va8tB7u4cNwC1c54OVDLr0c3CDIBO/WJPYi597kynHoDCvnu7PBcd7S?=
 =?us-ascii?Q?idocHBqHrQ2TfraBvADrUCsJ2emdxhgwphYjCBkiwgEmIPqDILV5rZly1dRJ?=
 =?us-ascii?Q?GeCDZ20konb62w1R3kMRd+/Lx7fcqpwoOXL15z7AMECnexGEjEfyyNGtIixR?=
 =?us-ascii?Q?ldya7Ct/tg5D65BCTOMFcQXv8DciWa3Jpu8huf+5SeEsi6ApLlhr3CmtV7JH?=
 =?us-ascii?Q?C0ESYotL1pn9FJ0NLwFmCCe+rAfZO5uiVSAyAZuWYHXhfmFjmIY39YmwSCX8?=
 =?us-ascii?Q?g64VWaiLUEMsfm7+1p6ZRYRs2j9hdYigcrV5lQbIPULw2wOILtAWiArf4rGx?=
 =?us-ascii?Q?mmoMNZx2AhNvqxb72Nd94MgUo0Cq/QXS1ktjXI3WK5RQmG5fWHNwGhwRmJ2N?=
 =?us-ascii?Q?lYv3DdLcnulScBK5kSeP1jpWW7IMrkvCfTSE/SUXDhFIdXJPaRAMTYPGC1q5?=
 =?us-ascii?Q?YQihw3bEvht+0fvueUqiDMQ5sUxlug5XLAmFOnBT2Dt7RAkKwE/Zgmw6Y/cO?=
 =?us-ascii?Q?ELdzmEZ4SJA5BcS8kXMcFgl5HO8FlqdBPl0fq8nOvRj4whGlKyV/6jPuPLcb?=
 =?us-ascii?Q?JKK+t6oy9WE4WAtbTrdIS7SeF8PbgyAasY7CpIc9l8TJaJwRl2Ur9X0NWwPc?=
 =?us-ascii?Q?JX6WcJKNbVKq+plFEEYTG4r0qKgTPU8FHM/gaI1jvoHFybUuLhz8nDhbxf/O?=
 =?us-ascii?Q?Iyi6duS76ZBG4I8sfQDY8XoR50+b2UaLHnc4YzieAbvGO+hmmWbAaHYqx+as?=
 =?us-ascii?Q?iTO6c6Hj6spDTtXOVrsyZ71WHxEOtoFuxh8RzC2PuYR2My4b6bFXue7H2/jj?=
 =?us-ascii?Q?P2J7n7UpY4KA1jA0oeEgGEpoi7+cVXlgTh5gZDqdjHltQT8yAq4iz+iXgV3p?=
 =?us-ascii?Q?w1tTFVbv4MVNIUTe/NOvQOgdZ/J7ZRH5WcWHYriIfDcFuD+63rtr7YoO+snx?=
 =?us-ascii?Q?tO8RDmvcm9vikelBpEXMeuR5C+ORCoL0lqjDd+/AB/UpV3oOT6nxAOpRCGaS?=
 =?us-ascii?Q?239I7rB6AK0nkhY2a8Oa4Ib/lFTQNnPbF4p0pQyrKzCuNtFCLZ+LUXIjYP90?=
 =?us-ascii?Q?HGZ0wTh8ZdLe0zu8jBymkmA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BL1PR01MB7747F58204241D07F2E006058D529BL1PR01MB7747prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b071071-0a39-4228-d427-08daa0135b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 23:03:42.5451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mru3zmwMUVZzvwYOVdjjtnU1QGRcQbNLfYYGvOBNL6m+348vAdHRlJxsJ+jhIxFQ2YQsGMRnydEz7ufvjiUBEiXSW1kNPKHmjfbT3auTBkK45zo2DXcuFiVY1sW942ks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5828
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
Cc: "zehra.ozdemir@inventron.com.tr" <zehra.ozdemir@inventron.com.tr>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>, "naveen.mosess@hcl.com" <naveen.mosess@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BL1PR01MB7747F58204241D07F2E006058D529BL1PR01MB7747prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Zehra,
I think the issue of isMultiHost() has been resolved with https://github.co=
m/openbmc/phosphor-buttons/commit/4250785723d92b6578176a2d961d47ab66e08124.

BR,
Thang Q. Nguyen

________________________________
From: openbmc <openbmc-bounces+thang=3Dos.amperecomputing.com@lists.ozlabs.=
org> on behalf of Patrick Williams <patrick@stwcx.xyz>
Sent: Monday, September 26, 2022 11:27 PM
To: Naveen Moses <naveen.moses@hotmail.com>
Cc: zehra.ozdemir@inventron.com.tr <zehra.ozdemir@inventron.com.tr>; openbm=
c@lists.ozlabs.org <openbmc@lists.ozlabs.org>; M. Erhan Yigitbasi <erhan.yi=
gitbasi@inventron.com.tr>; naveen.mosess@hcl.com <naveen.mosess@hcl.com>
Subject: Re: phosphor-buttons multihost control

Hi Zehra,

On Mon, Sep 26, 2022 at 07:38:39PM +0530, Naveen Moses wrote:
> The host Selector object is not strictly required. The host selector obje=
ct
> check was only added to identify if the system is single host or multi ho=
st
> system based on host selector availability.
> Thanks.
>
> On Mon, Sep 26, 2022 at 12:58 PM <zehra.ozdemir@inventron.com.tr> wrote:
>
> > Hello,
> >
> >
> >
> > There is an isMultiHost() method to control to return true in case the
> > host selector object is available in button-handler.cpp of the
> > phosphor-buttons. And if it is not available, it does not return false =
and
> > the project gets an error. So we covered this return line with try catc=
h
> > and it works.

Based on what Naveen wrote, it would be helpful if you could submit a
change to improve the implementation to not have this issue. I'm
surprised no one else has ran into the issues you are seeing.

> >
> > But my question is, does this host selector object has to be strictly
> > defined for the project to run properly?
> >
> >
> >
> > Thanks.
> >

--
Patrick Williams

--_000_BL1PR01MB7747F58204241D07F2E006058D529BL1PR01MB7747prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr">Hi Zehra,</div>
<div dir=3D"ltr">I think the issue of isMultiHost() has been resolved with&=
nbsp;<a rel=3D"noreferrer noopener" href=3D"https://github.com/openbmc/phos=
phor-buttons/commit/4250785723d92b6578176a2d961d47ab66e08124">https://githu=
b.com/openbmc/phosphor-buttons/commit/4250785723d92b6578176a2d961d47ab66e08=
124</a>.</div>
<div dir=3D"ltr">
<div><br>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">BR,</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">Thang Q. Nguyen</div>
</div>
<div>&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>From:</b> openbmc &lt;openbmc-bounces+thang=3Dos.amperecomputing.com@lists=
.ozlabs.org&gt; on behalf of Patrick Williams &lt;patrick@stwcx.xyz&gt;<br>
<b>Sent:</b> Monday, September 26, 2022 11:27 PM<br>
<b>To:</b> Naveen Moses &lt;naveen.moses@hotmail.com&gt;<br>
<b>Cc:</b> zehra.ozdemir@inventron.com.tr &lt;zehra.ozdemir@inventron.com.t=
r&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; M. Erhan =
Yigitbasi &lt;erhan.yigitbasi@inventron.com.tr&gt;; naveen.mosess@hcl.com &=
lt;naveen.mosess@hcl.com&gt;<br>
<b>Subject:</b> Re: phosphor-buttons multihost control
<div>&nbsp;</div>
</font></div>
Hi Zehra, <br>
<br>
On Mon, Sep 26, 2022 at 07:38:39PM +0530, Naveen Moses wrote: <br>
&gt; The host Selector object is not strictly required. The host selector o=
bject <br>
&gt; check was only added to identify if the system is single host or multi=
 host <br>
&gt; system based on host selector availability. <br>
&gt; Thanks. <br>
&gt; <br>
&gt; On Mon, Sep 26, 2022 at 12:58 PM &lt;zehra.ozdemir@inventron.com.tr&gt=
; wrote: <br>
&gt; <br>
&gt; &gt; Hello, <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; There is an isMultiHost() method to control to return true in cas=
e the <br>
&gt; &gt; host selector object is available in button-handler.cpp of the <b=
r>
&gt; &gt; phosphor-buttons. And if it is not available, it does not return =
false and <br>
&gt; &gt; the project gets an error. So we covered this return line with tr=
y catch <br>
&gt; &gt; and it works. <br>
<br>
Based on what Naveen wrote, it would be helpful if you could submit a <br>
change to improve the implementation to not have this issue. I'm <br>
surprised no one else has ran into the issues you are seeing. <br>
<br>
&gt; &gt; <br>
&gt; &gt; But my question is, does this host selector object has to be stri=
ctly <br>
&gt; &gt; defined for the project to run properly? <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Thanks. <br>
&gt; &gt; <br>
<br>
-- <br>
Patrick Williams <br>
</div>
</div>
</body>
</html>

--_000_BL1PR01MB7747F58204241D07F2E006058D529BL1PR01MB7747prod_--
