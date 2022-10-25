Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EC60D965
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 04:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxtRx13dPz30NS
	for <lists+openbmc@lfdr.de>; Wed, 26 Oct 2022 13:44:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=rpM/h4CW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.177; helo=smarthost4.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=rpM/h4CW;
	dkim-atps=neutral
Received: from smarthost4.atos.net (smtppost.atos.net [193.56.114.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxRtl5kfmz2xjj
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 20:47:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1666691248; x=1698227248;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0oaJSiMV7xgzwUGt6hHgum63VAyWXGUo4LtYYg4WBE0=;
  b=rpM/h4CWHpZrhuiS7gfRW1E0T5Cc+8nYWnfaBIGya0maEvqJ7pw5BCjQ
   vsmam2MzwHgY5NXPfnX3tMxd6iX7XLZg2Fb8ZqTEfRzqotnyFr/l94hIz
   a9EMn0UEne7LcUsU8Vhk4ORt4keRTbllt8DNIxJnyHxas3E/ngHtx1lJG
   vf6Et9A6u2xpBBtOuHVSChRzwws+ETAQxkjHKLcqVGr3aKEDEEt9NOkYl
   eAH5qMqju6KD6eoNL5gOCWxocfb3p6pL9yqf5aSR7/Hvea9tFBcZAblVF
   Tvn6UmxiaXWMswQfsI7V00pKmNf+wl+txhu/jpBxGuqWWfwMUh9HFZEI2
   A==;
X-IronPort-AV: E=Sophos;i="5.95,211,1661810400"; 
   d="scan'208";a="423856276"
X-MGA-submission: =?us-ascii?q?MDHBw0UPzx6fWgv8EzIuSg5kzdsaHkxDrNTx2k?=
 =?us-ascii?q?Nby2JSLnhpvMuNMMkaozR8UZN8hVmZuYa9JFLYo/fCQJgpPVG1/5jjgj?=
 =?us-ascii?q?gtIOE8Tcx6pL4029U1+99QgE7cbPpgffvUTdjjWgDIgWDw+fmCNaBdcX?=
 =?us-ascii?q?vq?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB12.ww931.my-it-solutions.net) ([10.89.28.142])
  by smarthost4.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2022 11:47:19 +0200
Received: from GITEXCPRDMB12.ww931.my-it-solutions.net (10.89.28.142) by
 GITEXCPRDMB12.ww931.my-it-solutions.net (10.89.28.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 25 Oct 2022 11:47:19 +0200
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB12.ww931.my-it-solutions.net (10.89.28.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Tue, 25 Oct 2022 11:47:19 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPQbmm0/HVo6YCLLL4lQsDrrFIw2Egz7KKWnKJ0loSnWQDqXNic1288RzyhHm7o+Jl0tnF77EqxfA6ZJV0+25YF+DI1lZj8ACJrJ2nJ4c322a4bsBvDgguzqAuymklFTD4SLzhQQ6XFLdTWEZOo1x2iJYbdSv9q0Jn3dZj6UOzi/+HyDmBHtRTK7rIdE9fhhZQbMyWREJT023tMkEvN/8Q3p2hXoRDFejGms11rMeI+VTWc9YwqHq61PYYzYis2v/heCMc7D36YR0RAnQIbcv2aQYbr5/9mEGhPSLRqDXLPAqfsh+tRSPDx4hnqLf0fvrrhVBMoKd7GCX3h2NJ8daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oaJSiMV7xgzwUGt6hHgum63VAyWXGUo4LtYYg4WBE0=;
 b=QuPxvMDDa9BWm+4B0OajvPTQ8S8E6gM3woIsGIPi8vgEaGtuR8H6YidRrULsrqsaWRVWpuOBivfNx9YHTyHduKTBtU1rb0PgCLPLA0FzhqZKtdAqke2Za6Rj2+IetkLGE3wqHHLRnx3Qu88t9H0mZUCOwkweCdIsToYFjVZZkPwLtgq2KRGCeswEEtpDkWxwxwr5qk7DIq34Awf+yka5qkRqSvOU87h1WY2w8lWOTcmiPWC+CFzF4djIRS9tjTHOSD/+MvvyEa4xfgq2TQXwCgz4y4LkmR5niovVN9633bsdpfrEOFSDS9ZZKz0kDciR6wuL5hoiaIiiQQQKFpaBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by DU0PR02MB9775.eurprd02.prod.outlook.com (2603:10a6:10:44d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 09:47:17 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::30ea:df34:ae61:24b7]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::30ea:df34:ae61:24b7%4]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 09:47:17 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: compiler error : get_if<> with a variant enum ?
Thread-Topic: compiler error : get_if<> with a variant enum ?
Thread-Index: Adjh/8IAYnQ4mETfS2au9W7IhFbaOgAgaEuAAA+KbIAAeF4TIAA7D/wAAIW5i5AAECRUgAAcdSdA
Date: Tue, 25 Oct 2022 09:47:17 +0000
Message-ID: <PAXPR02MB768060E7288F2F21AFD027BFE4319@PAXPR02MB7680.eurprd02.prod.outlook.com>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y1MDmAFeL1kg/5ip@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680BF2C5955F6977D83B2D3E42E9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y1bxVdFInc9G7gJ9@heinlein.taila677.ts.net>
In-Reply-To: <Y1bxVdFInc9G7gJ9@heinlein.taila677.ts.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-10-25T09:47:15Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=d34477d8-b7cd-4b69-a709-a377a3fe685f;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|DU0PR02MB9775:EE_
x-ms-office365-filtering-correlation-id: 2e5029b2-077f-448d-1d72-08dab66de744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HI9203ehDdzhieK4JkqDIiwNgBybKlZnpkse3ImM1FzrNnU7miBy6A3ScneCn1ILX5lAMNMoF5xfnW9yUvtWzGSfQpQ6vPjtJu3ci2JzcDbZpJFC253t7fCLzDnO6KsJ8doT8M1gMom2veUqXG3cL93SikgTBR520Nm0G0Tthx6ZJMm3hbLtOLogW22frU+WHI3DqW1g39bf+gOdj8YzuOa+tVuJBFL8xjzMGqO2b6z3VA/5L0T0B1KtDc6HvKQ0js4vgyMAkLa2GjNzA86iOggHuH3JesmydyRyTM29/4Yd/yC4eCDRJsbGYeg8qe2oxgefFNK6IWCyiCvTvI19CBgfNITTdnc4yB0Uh7i4A7V+1PHDWY5l1MWOUiLdlAcvAImtTnk0OWlkwR0mdwYUAF1nHZFRCdH6gI7c6WoQ7IPoleGMeVMnqqV1nq+f+BKtjlKFdb/NiqYHbgpyIOw4YkjeysQN0Vf7f8zi26Uz1Zp2KwRCR6BV3Yn7W5h7eqs1F8nIPhiVUmtEvUs5eqR1jTVo3WxY5SVLJefwGPn2Ay7PIDYnyupH9HTYzo79RTwTgo1CVIMAw/LRsr99wbElaO5yFImFO4vAjcCukjhqummHv2xnrWbmhDBMXrWxmNNMVGv+wr49TzqOTnyQlkrBf0iTAxfje18TEZkvV08Y4CnVyjLfRhlOe4rLEx8jIsU1DLxoJCQPgqold4+l2LVQfE1YvRZizJ9SB3upGmRzFGADB6qODe7QP2+NTAlbM/Zk+l+5nMr/NFrhn0nzRCtJTJVEfZSzS/m4MxDsI0AjhBvKAaa/UuPfAwnfSOovHwy6z/sQ4uOhgUbWnJRdPfwg7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(66476007)(8676002)(64756008)(66946007)(66556008)(76116006)(4326008)(8936002)(2906002)(86362001)(41300700001)(316002)(6916009)(5660300002)(44832011)(82960400001)(66574015)(55016003)(33656002)(122000001)(38100700002)(66446008)(186003)(83380400001)(6506007)(966005)(478600001)(71200400001)(55236004)(9686003)(38070700005)(7696005)(26005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?se/0O0Aa2YYb5UbjQYNf5btEORXNEkyH4QEPrR0fXSvkhDYuhhoi3WRRsR?=
 =?iso-8859-1?Q?44UYUWx2Pbt/rFOJfps+DR5qMI//STHnpErZnhHs/7HmqMEBC3CcS/tTZ0?=
 =?iso-8859-1?Q?B3y6PAjP6xwDMBSKErWcMA5wnEdc+q9adOtqJ5QgneJacDcdktQuldp3ur?=
 =?iso-8859-1?Q?JxDRo5pW8EYUYUBf1inEzgr0/SFdJb23+hAdAyfw5bf/90GAM7yBkmk5k3?=
 =?iso-8859-1?Q?NzpNg+We4EsbCmWVhOPDhUJkearJcOxEVtw/CMR5E7MvqA4KZYveyr+2Vk?=
 =?iso-8859-1?Q?parz/sVvIWSMdbmooX6MvklvnGHx+Djvad+oiLM5+G2KFM8vl0EHmPOKEY?=
 =?iso-8859-1?Q?p/MyGjDgLiGA1KUbrAGVOjacZC5qicKQJ2G9ZdCEd9MqdDocGI7WzxMcAt?=
 =?iso-8859-1?Q?e2cRlNbZs5Zs1Pf/4ch1c6oH8uqcEGIIoKRxu7Mn3csGsA+aN8r9b/A79C?=
 =?iso-8859-1?Q?gCYy+39kxCVtvNE3Dqo3/y1CJIrcr+N6UmTEem5ZlbZwdh9wCVg9OY4nlg?=
 =?iso-8859-1?Q?pUSUmX9e/BmYoj1j4oZEgOwL7WLCvujYFf/9d5EQSpJQUZrkb+UjhFNgIA?=
 =?iso-8859-1?Q?8eTUz+VLxstBm5E3ZYTsJy9h4UawDPMmI2X9YM8NseJLXtWhxKuGgjWftm?=
 =?iso-8859-1?Q?CKqLTBXmBCeFuN82T4g2R/sPm+U12xDhfL/P7hcGDmJCsTMUEMankpZzvx?=
 =?iso-8859-1?Q?S0YNyz+ybMAgaPmE5Q4Q75WJOqd5pRVornyDKNqqo1Iloy/m6WSmN/txA7?=
 =?iso-8859-1?Q?Qms7XKfWzgd0c5PejO4KLF1FQCJLfUqKfV/ku4HTxloTckYZFjmHYC2xhT?=
 =?iso-8859-1?Q?WdBMpNIM8wtZUvM/jEhiOhcPeLXygzrU/qKGocvFyZ/D/BfjAzzIUOrCw/?=
 =?iso-8859-1?Q?/qEHdZFBl9mZ4pwa/U+l66uYMTNFjvCL5//3PDItXOms0YaMB24VIbbY4F?=
 =?iso-8859-1?Q?b/Fri0sHZ0dMWro5GOyo9g7o/479OaY5SPyMSG7DtmJm5gipazqcsN3BPe?=
 =?iso-8859-1?Q?Du4JjBOSeFj35dLx7dJ1w53OTBrAicUMNgSGvQMU4rQ+CInl/mm75B/rkv?=
 =?iso-8859-1?Q?ZY1qy9+0PDHIXGFfbpSMnSP8n6G2lEnhwFsyounAEjEodtdlHuYMLwBSeN?=
 =?iso-8859-1?Q?W0qiUXL2gLFle6r7nkC21Zl0tGiNa7g7qRvcOnfm82Qb6IIcGoF7tEVT8E?=
 =?iso-8859-1?Q?f6ZvYHmQDsyFrCJxTj1qNK2DNMn4pCsITA2WHohxqqpXiMH36Xdri3k4eo?=
 =?iso-8859-1?Q?RyNaT0qVTd8OmhLi+MMLlJz7DO/PiL+HnOWnuwJnelRQLMh6ggQmA0IJlJ?=
 =?iso-8859-1?Q?aVim4KUkG3VBOyJ+SF48TiOyz90076NxmovpgXwBEiaSyhgchh6eEOyp1s?=
 =?iso-8859-1?Q?gR78I3D2kYGvt3tMhXRiyZUTHD3O44fONCrPXWYGDj7vY36TIe5dkYK4QF?=
 =?iso-8859-1?Q?mMD3G6f6zBjhpcl79bgIw2vbRFxqg0ZoY3WL1V9zBO6mXMejzY045P3Qon?=
 =?iso-8859-1?Q?gPfIETHHj0X932Tvyr6pD223hJmQmTdjL3MoB2/jc4XMRwMZy4BzAf3d3a?=
 =?iso-8859-1?Q?J8KIaOVA7poqsy1HJJIqYgXDSYfP/b6re9x+hCU0/AjUAfMZsjk+yjtWMH?=
 =?iso-8859-1?Q?CQdNkHj2Y/7QTBJW+TTAd+NljV/dI37+JN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5029b2-077f-448d-1d72-08dab66de744
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 09:47:17.3725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /55RNCN7BVF80IJq8KyvEgrTcphN1uTIjOvLzjost488v9fFZU8IX5sw4/VbPrPxNAA9HtP1EtlLzLUlDCRgr4/tnH9Zf4wB62iAr8W81O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9775
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Wed, 26 Oct 2022 13:43:43 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

Yes, I understood yesterday that a fix exists in the latest code.
I will try it when the devOps guy come back (tomorrow), and I' ll let you k=
now if it solve my issue,

Kind Regards,

Francine SAUVAGE
Team Leader=A0- R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS
Avenue Jean Jaur=E8s=A0- France
atos.net
=A0=A0=A0 =A0
TT: [Wednesday or Thurday(2nd week of month) ] - Friday]=20
OoO=A0: October 31


-----Message d'origine-----
De=A0: Patrick Williams <patrick@stwcx.xyz>=20
Envoy=E9=A0: lundi 24 octobre 2022 22:11
=C0=A0: Francine Sauvage <francine.sauvage@atos.net>
Cc=A0: openbmc@lists.ozlabs.org
Objet=A0: Re: compiler error : get_if<> with a variant enum ?

On Mon, Oct 24, 2022 at 04:31:03PM +0000, Francine Sauvage wrote:
> Hi Patrick,
>=20
> Thank you to help me !
>=20
> I tried :
> variant<MyEnum, std::string>
> =3D> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:

Can you confirm you are using the latest code?  This symptom sounds like so=
mething that was fixed over a year ago now:

https://github.com/openbmc/sdbusplus/commit/a22dbf40a115d5cd133e67500afa387=
b317cac14

We even have test cases that verify this exact scenario:

https://github.com/openbmc/sdbusplus/blob/293c8a26901f39fa3c9a34be9b4ad530c=
5592f90/test/server/message_variant.cpp

>=20
> " I think you could unpack a `variant<YourEnumType, std::string>` from th=
e message (or dbus call result) and if it is your enumeration it'll be inte=
rpreted as so but if not it will fall back to the string. "
> I agree, theorically, but the "read" fails (even if callMethod is OK) :
> ----------------------------------------------------------------------
> --------------------------------------
> using FlexDbusVariantType =3D std::variant<
>                 sdbusplus::xyz::openbmc_project::Inventory::Item::server:=
:FlexibleModule::ModuleTypes,  <=3D=3D=3D=3D here is MyEnum
>                 std::vector<std::string>, std::vector<double>, std::strin=
g,
>                 int64_t, uint64_t, double, int32_t, uint32_t, int16_t,
>                 uint16_t, uint8_t, bool
>                 >;                =20

What happens if you drop the ModuleTypes out of here?  Does it run successf=
ully, but parse as a string?

Is it possible you're missing some other type out of your variant list?

> using FlexDBusPropertiesMap =3D boost::container::flat_map<std::string,=20
> FlexDbusVariantType>; using FlexDBusInterfacesMap =3D =20
> boost::container::flat_map<std::string, FlexDBusPropertiesMap>; using=20
> FlexManagedObjectType =3D std::vector<std::pair<sdbusplus::message::objec=
t_path, FlexDBusInterfacesMap>>; .......................
>=20
>     std::cout << "Before calling callMethod" << std::endl;
>=20
>     auto respMsg =3D bull::dbus::utility::callMethod(
>         bus,=20
>         "xyz.openbmc_project.Inventory.Manager",=20
>         root_obj,=20
>         ORG_DBUS_OBJECT_MAN,
>         "GetManagedObjects");
>=20
>     std::cout << "After calling callMethod" << std::endl;
>=20
>     FlexManagedObjectType managed_objects;
>    =20
>     respMsg.read(managed_objects);  ,  <=3D=3D=3D=3D here it fails
>=20
>     std::cout << "After reading" << std::endl;
>=20
> ----------------------------------------------------------------------
> ---------------------------------------
>=20
> If I don't declare MyEnum in the variant, I cannot use get_if<MyEnum>=20
> If I declare MyEnum in the variant, I always get a runtime error =3D>=20
> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:
>=20
> If I remove MyEnum from variant, it works, but I cannot compare strictly =
the Enum, I need to convert.
> get_if< MyEnum > is not possible if my Enum is not in the variant,
>=20
> I will be pleased if you have any suggestion,
>=20
> Kind Regards,
>=20
> Francine SAUVAGE
> Team Leader=A0- R&D, BDS
> Atos France
> Mobile: +33 6 21 43 11 21
> R&D, BDS
> Avenue Jean Jaur=E8s=A0- France
> atos.net
> =A0=A0=A0 =A0
> TT: [Wednesday or Thurday(2nd week of month) ] - Friday] OoO=A0: October=
=20
> 31
>=20
>=20
> -----Message d'origine-----
> De=A0: Patrick Williams <patrick@stwcx.xyz> Envoy=E9=A0: vendredi 21 octo=
bre=20
> 2022 22:40 =C0=A0: Francine Sauvage <francine.sauvage@atos.net> Cc=A0:=20
> openbmc@lists.ozlabs.org Objet=A0: Re: compiler error : get_if<> with a=20
> variant enum ?
>=20
> On Thu, Oct 20, 2022 at 04:32:40PM +0000, Francine Sauvage wrote:
> > But, I get a runtime error as all my objects are different:
> >=20
> > what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString: An enum=
eration mapping was attempted for which no valid enumeration value exists.
> >=20
> > Is there a way to add enum types to the variant of a ManagedObjects tha=
t potentially are NOT in the object interfaces/Properties ?
> >=20
> > Or is there a way to filter the objects in ManagedObjects dbus calls ?
>=20
> I'm sorry, I'm having trouble figuring out what you're trying to accompli=
sh or where it is having trouble.
>=20
> I think you could unpack a `variant<YourEnumType, std::string>` from the =
message (or dbus call result) and if it is your enumeration it'll be interp=
reted as so but if not it will fall back to the string.  You can even do `v=
ariant<Enum1, Enum2, Enum3>` and it'll turn into the correct one.
>=20
> The important thing is that you need to pass all possible types into the =
variant when you attempt to unpack it.
>=20
> Patrick Williams

--
Patrick Williams
