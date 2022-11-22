Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE863834F
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 06:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJN785G0qz3f33
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 16:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=ZsSEvR+l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.177; helo=smarthost2.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=ZsSEvR+l;
	dkim-atps=neutral
Received: from smarthost2.atos.net (smtppost.atos.net [193.56.114.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGmcP1s7wz3cKW
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 01:20:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1669126805; x=1700662805;
  h=from:to:subject:date:message-id:mime-version;
  bh=CnOvX7rRBHLg0DtEiyBdnQyMGgMi5iyEqtxhnxXqI14=;
  b=ZsSEvR+lQgZ2lpQ3xRxUwHdIhHa09JiI32AZa+jUSwoy5Xq27GSeLrqk
   x+G4UFyzeHZQnjLiTK6GJ8M3GS/DNBBY/M+AfNRtnaxCXuE5uhU9CuEih
   BAJM10XTH1ZprAG37fRN5K2Cwc7eR3gdfLPAR2kYk0DDPYjOc8mWYZpmv
   mZZuzaIViK8CshZzeTmGVxrkRCOE826FnHrJubbVEV5nrfZq7lHPJEo0T
   bQpIue9ThyDQGP8vnFQpjJ1PI9fgNdOZtMIMi4CqjpaVI5gwUdFkNjccj
   lytphHsuCKXR1oyA4nF2ROHLLapIzqbNViMgyK4N8PgW3kVeTrezuxxFg
   g==;
X-IronPort-AV: E=Sophos;i="5.96,184,1665439200"; 
   d="png'150?scan'150,208,217,150";a="431599478"
X-MGA-submission: =?us-ascii?q?MDHTdXWFZomZ/LV+MS+srnLNZllW4dH2YvBV2H?=
 =?us-ascii?q?iix5+5F/BwTOS+gJt71voxqoGkZCNhOx8q0+sMTv8/b2yJhEawmFsml/?=
 =?us-ascii?q?vhG+lZH1EqobY2LMNhRKiSZB4utlgYynUL716twxwT/8n732h8m1RwvQ?=
 =?us-ascii?q?oU?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB14.ww931.my-it-solutions.net) ([10.89.28.144])
  by smarthost2.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2022 15:19:51 +0100
Received: from GITEXCPRDMB13.ww931.my-it-solutions.net (10.89.28.143) by
 GITEXCPRDMB14.ww931.my-it-solutions.net (10.89.28.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 22 Nov 2022 15:19:50 +0100
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (172.16.214.172)
 by GITEXCPRDMB13.ww931.my-it-solutions.net (10.89.28.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 22 Nov 2022 15:19:50 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM2lyYmAIbarrdNsV3Ia2O3QG8imkFoEfX/T6ZVMpsFltQP4hvaneZ34OkX7UaTb2wjXysJNnFGpVQn5wfjo96QdIdYLExh3Uq6d7Ayo861wLxqWQSakt5Nq7dzf1kKjZXxZizMlRuQkC32i+W0hrFFPxnItkmVoDykmVevO1HQt4X59SXS/87E6l5lH+TB8D6nm2MxSleDCFzwGuNEOh5cDUf3tYVCHpEiNurfVsiuoyJ9NmoRIfhig1fB4apZFaLYYwX5x3d+rZLQIT+W4JrmlDhf+ro1tAja+vABCE7lIAAayz1pr3mBXrYgt9D5htt6St2E5a6zCtGe6iFqPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnOvX7rRBHLg0DtEiyBdnQyMGgMi5iyEqtxhnxXqI14=;
 b=kRI915TljiSFqQd00kpHGuHGBVIgXxqpH1AVPX9C4WaJqIES+AGqnsu6XW26Ggj3B7ZocumsoSihz9UIkkfVlTamRTrlay57uGzXQwPszNUjLramSj4TIyK6fMgqIoQk9d6t6E2ibNc4bxNxH05QqoitBd/cwKQKoK8EliEpdUUfwD1sONgQ/S7lE+ICG/1TBxr6g2R2jvXkCqi7bhNQiIna8iSvkBObXl/dtLQNtSFCPWE3rVhKubCdVjZskriNj2vtzfyefQXxhg01WhcTFhZeFfBd3O8OWel8Tc68Qi5HvgaBt6uPiQdhWPj6jneGgZovMa9gtPTpVKrP3Y/0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by VI1PR02MB6190.eurprd02.prod.outlook.com (2603:10a6:800:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Tue, 22 Nov
 2022 14:19:49 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::98:7901:824e:955e]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::98:7901:824e:955e%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 14:19:49 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to declare the default value of a dict in yaml setting ? 
Thread-Topic: How to declare the default value of a dict in yaml setting ? 
Thread-Index: Adj+fWlmIgg6xqPaRSGt8dAPOCaYvA==
Date: Tue, 22 Nov 2022 14:19:48 +0000
Message-ID: <PAXPR02MB768073FA27508BD2B28EC72FE40D9@PAXPR02MB7680.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-11-22T12:56:11Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=32d0afa0-de73-4208-ba97-a02f79cedc46;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|VI1PR02MB6190:EE_
x-ms-office365-filtering-correlation-id: c439d10c-e1fb-4647-5e2f-08dacc949d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: njO4pw1MD9sYxxYrDgehJDI/EM/Tp6cMj+4aUa6EAsnkNg1kwg6f/57e6ExMZpT1BfeZvFP0P2IdGyisdTkY/ThRUsDvB0CXl9dfk3kYgGB331a/zxp5fRdngjpSLqac6v5QWRkjR3jmR8haKBWUMAPF57gBuGCnIac+4gGL8647dmuZW7uS3ix2DGo+eqyrcyTihvzQeqJKtLrmDAeV4XcOQXvQsBHVdP70td0kBiVpHURzWRzygJ+ZRMCw2z+nUTlsg6kI8dJhVKXpsJFOOdH661xKPLXZyY/4oOqIAOHhf6J5Qxj3T/TdXBaDneHwoODyCbDA/nijrSoiWu9oOJaXJWQKwnztJXf5/2A1q04k3LCcSY4tZr/3HPqHxGrkMPi/rZD3oXo0F2zQ/JeZQh+s13ykADUahAqfQIVYQ/0f53WLAeERdu5Rh1RYN/F17RmUgvJZQlrBCYCzN/yWYaNBAKn4FnVJjz/wXLpFPGktwQvrKnoLOh4nKo5RL6SvS5dIyCS6Tlzq51S2lvkECnXXzctU3ByZu19zujWBzoT71yC3Gmq251fZlbE6uSFyIcba9TM17aWLt0AMEAmU8FQdCIwmGWU75Y+fxzVhwIJgZpBxmnTTLyx82zyBApg13yO8+WVUraVEEo4RjBZPJDCOQJ+Y3IOCA9/+V9v5DVt1DIMk7SE2B9nYbN4O7fbxPyyNKl2Zfu/mFjOYXbcGtR/Y4dZ7rdTRK/98MzEzQWY1/tQBh71ru7ydtmJgfL5Vudfvp+4A7cWgBI46iCcaVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(41300700001)(76116006)(52536014)(8936002)(44832011)(316002)(19627405001)(66946007)(6916009)(66446008)(5660300002)(66556008)(66476007)(64756008)(8676002)(82960400001)(86362001)(6506007)(55016003)(71200400001)(478600001)(4743002)(38070700005)(26005)(166002)(2906002)(7696005)(186003)(4744005)(9686003)(122000001)(38100700002)(99936003)(55236004)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2wIrdT2dwBodJEH6zbwVvCddInESoJIgfe/paxYoNRrlN5zrxEDVOyA+5B?=
 =?iso-8859-1?Q?sRW2eLN9FMxc0T4exjIwCGjTQZjy9ZJq7/y6fuWWYo9EO87PxenUo9C7Ry?=
 =?iso-8859-1?Q?l3t35dLHBDlHqRY6+4D+f2GzkYppQHizdvx5Lf2XoUd6YkSEx1RgQLE6lS?=
 =?iso-8859-1?Q?5Df+NneN8A52sZjyhTzLfAE3mJjX2CFqHuLraJ8GN14FAs6HASqbp6SlBk?=
 =?iso-8859-1?Q?0A7K+g4kYdnozIYGYVP3q3MAa91BBtZPiGH1nI0Fyr56GSe5t9WDzIymbY?=
 =?iso-8859-1?Q?OPNbs82gGCIJ8STRghP5HtsHlY7MrjcQgoy2U3tv//ZOArud2XBPZ51GuX?=
 =?iso-8859-1?Q?UhZboj6gFAAoNRFAeURdxkF2ece2EBqk+nt2Fi94MdSdo/nFBMZzJNAg4D?=
 =?iso-8859-1?Q?qL3L7doyVm5Wh1W5NUK9DjYxA9V2x/WqmaxU8agtpWTk2GlhOVJnmhT7JK?=
 =?iso-8859-1?Q?HYITPkZRfo9VtJY4Nd1e7b7CEgCjAwTaIrK4rEcRpwABO4lifE+9YcQgis?=
 =?iso-8859-1?Q?iKlvIJq0TBnbJ5L0FM1gXZwgfaqU+7OwFxSIpABcSa09YToGio9xvM/uuJ?=
 =?iso-8859-1?Q?pGRot4XVU2s7lWA6acmu6XE5Wij/QfEu5Hx0fqr2Xttvxc0Axxg40Lvwmo?=
 =?iso-8859-1?Q?vz5C9RkYr0/8pajSvY/eBUF4+OTodLX8vbSzxPCUKvmRfL+Uwd16Z2PRyW?=
 =?iso-8859-1?Q?5voT/gAkuseAraomazL7MbTkzCwoQf1RbOascSAmb47RciUsarZ+Xde4w4?=
 =?iso-8859-1?Q?rKfTxxAE3KqUiAesRprNLx77Zco0j+qx0Ry94Irz9K1eF9NfSGkmD2PLWy?=
 =?iso-8859-1?Q?qlXW8jvqUike5aIlUcrkPqQjQQAsbumRaF/FwGhsI9crwd3+UDYc3v7eRy?=
 =?iso-8859-1?Q?iftbSgl+/W6gSQGmNL0ZdN1Bl02pfKQu5Xu5NbTdXfTk0boPSExWQfYe2z?=
 =?iso-8859-1?Q?BgKJpD47ktdJdAWvPjToiy2QeFKbw6OzhQDYCaDIvUheXIZLjZYd/9yYUM?=
 =?iso-8859-1?Q?2+xPw7+HfVkvVdhKXR7AmiHMKCnDMu0lWn56Dpy5RTK9YjFuy90t7/hfoW?=
 =?iso-8859-1?Q?vHhe9vz6Wsj3LqGUYcPqxCmL1I+EO1P9uzm2HRdXQo+vnsrqbK7d2L+4CY?=
 =?iso-8859-1?Q?agKJ9PDR/K3WNAmD4D/kWTeSRPj263F9+mxPsxJ7/3y3tMYNaBEKrlCGHR?=
 =?iso-8859-1?Q?b4sU//tRU/jMxz2cg0usH5pgLLY5PF6yW68S6iljbhlBlXdMh6jUJCn/OY?=
 =?iso-8859-1?Q?752Zk708E9sEpaiO3Rl/hsPNbcRzSABiXxQyZxsa7FdRz5lVK3vvcnTA51?=
 =?iso-8859-1?Q?pdZwak1XlAg8T1Z0CiyY/O9sV9Q6MCAL/rdH6Odcr8l0CswU06wz7lmrz1?=
 =?iso-8859-1?Q?U7J7qy9NblLz5jOqi3yD+3KugThMG6+mOnwbveCr+sSW8MKHOicEiLD30R?=
 =?iso-8859-1?Q?vvb/7Nn0oybk2+LBEsstPvlflD9onNT4IPek2U5iVjSR18XAzvn8/E4gwW?=
 =?iso-8859-1?Q?GXner+RS2AHI9V1aJnLswwqf7ZcePLfi82clyvR+1Z+hs+rGIxSAqSycW1?=
 =?iso-8859-1?Q?B7TOzARmeo313aEJubXDDFLLTqaE5zl+noi/81fGe15GWY1fKE+bq33O+I?=
 =?iso-8859-1?Q?uMldOzD8duqWZccmOGgoyn5kPq05AhAXEq?=
Content-Type: multipart/related;
	boundary="_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tm0qfnWD9/ReSN3zO8uQyh8LBxlU21P4qz9h75bPwO4InyiEpow/TBmbw5ghuIo9cad6kREfs/N1GjToSWmX5Bm35kDwMmKjJnT6D0YR8f9xvy/pF1zNGJVY/rQi7Bd8N2tYDV82rqRLFhtNlrpy8/ElZR/CEfyzkGkgD7glbD792i9jqS1qVZlRJ6jVkNUv3P/CNFspxc56AmHWm2bY3o65Zns9brheiBkDAY2PQomNcW2v0qSKbxoQMAJ7hSnFCnu14wCFAQJOQV4y1rHhZZDWwjmbNCq1rafvBUlYzO/SJD/KFYkQp7Z5U2C82xu5X5gfQpNy5FvUmVxIgfKrHqcw8TFc1h49lWWzSehvY78xrrHG/xpju21b4MEVscvmtMerKBAMsRSftIVY+sJ4sjMQ/oRVglWi6waPgoaC3O7UofjBcJRQOshQOSGA9JuxNxc6hSijU93hjl2BXGg053mXntjTsuJSScMMlMwQrsIN+FW90vvP4jQidu7LQn2gp1F9roOmcbGWeSMK6fuBWd03jj/bBj2j6GKgUJtze0SXyVTM2Gr79XEY9ZihuTbc8vcMtxMsuFTA3Rc4DZbbslfF7Bqoq0ET0P1PbaW/ycG91kup6wYot7ol+Z3Ru9ORdruZ3v01lWxF3uWwKPynHv/pN0Q8up59JWOxBv/SpWQv8C1ZaMJiLnkaGhv+zOnx1Vh+9a9JT61Np98tKqN9eeefu0xSNBKPnj8SWlgu0mbk9UimflneG2SPI7MXhcL0EyEiE76ZTOZOUaW7jg8T04uHpn4bdua6y6+YnQaRC6GpSwCGHQkKjxkj3/FdPSd2G4I14c6OC0zkflkQ2DUttA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c439d10c-e1fb-4647-5e2f-08dacc949d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 14:19:48.8028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFv0wElAKB3dM7PR2Thc7ZI0tOl5ATWMd6O/7uWGFHAee3zmP2anVsaioLZnkg1s1Dd1vCxxCGwjI49rwGVB/ajSbvG+psbYXwJV1KJjypk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6190
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Fri, 25 Nov 2022 16:01:27 +1100
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

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: multipart/alternative;
	boundary="_000_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_"

--_000_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I would like to serialize a persistent data in the settings (phosphor-setti=
ngs-manager) ?
I need a default value, what could it be ?

- name: MyData
          type: dict[int16, array[byte]]
          description: >
            A dictionary of DIMM SPD Data.
            default: ???

Thanks,
Kind Regards,
[Atos logo]
Francine SAUVAGE
Team Leader - R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS<https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.youtube.com%2Fwatch%3Fv%3DP5g8tSWkCkU&data=3D05%7C01%7Cfrancine.sauva=
ge%40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70=
b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=
=3DMs2gu2PDvBD4Ogl0AhLpF1HllKl3s3kuv6Gw63nHDbc%3D&reserved=3D0>
Avenue Jean Jaur=E8s - France
atos.net<https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fatos.net%2F&data=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff41=
6c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C63800487585=
9707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DNEcchSNjDs2j1pcXCrru2MeIz5U=
ii38xg5HJEbPFQ2E%3D&reserved=3D0>
[LinkedIn icon]<https://eur01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.linkedin.com%2Fin%2Ffrancine-sauvage-consultant%2F&data=3D05%7=
C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C3344=
0fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&sdata=3D7EnlnxDQG8AUgBlflxPI3uj9rUlQ6RfFTYAb3LtdzzE%3D&reser=
ved=3D0> [Twitter icon] <https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Ftwitter.com%2Ffsauvage&data=3D05%7C01%7Cfrancine.sauvage%=
40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b01=
98d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
zUWVIquoEIy%2FDH1HSFRPEBNDDTF29tvWkONSvtqkfXc%3D&reserved=3D0>  [Facebook i=
con] <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.facebook.com%2FAtos%2F&data=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C20=
1b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7=
C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DL1LDaAUjf%2BpPO=
lU0K1rMHB5D%2FrvEomEgpM2Ghvpx4DY%3D&reserved=3D0>  [Youtube icon] <https://=
eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.youtube.com=
%2Fuser%2FAtos&data=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff4=
16c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C6380048758=
59707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D18CHBR%2B1ap1a8%2Fv35you%2=
FGKiB0XoG4%2F6UU2cL%2F17CE8%3D&reserved=3D0>  [cid:image006.png@01D8FE7A.DC=
958000] <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2Ffrsauvage&data=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C201=
b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C=
638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dur4%2Bou5o0JK2u6=
359ELCRwiSpG3ej%2BAW65DyqsC4NeE%3D&reserved=3D0> [cid:image007.png@01D8FE7A=
.DC958000] <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fhub.docker.com%2Fu%2Ffrancine78&data=3D05%7C01%7Cfrancine.sauvage%40at=
os.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5=
a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DmRgv=
8%2FWZgU54cKGTQF9zARI9p%2BJOxESouwIGZpJCdS4%3D&reserved=3D0>
TT: [Wednesday or Thurday(2nd week of month) ] - Friday]





--_000_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:inherit;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to serialize a per=
sistent data in the settings (phosphor-settings-manager) ?<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I need a default value, what co=
uld it be ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background:white">- na=
me: MyData<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type:&nbsp;dict=
[int16, array[byte]]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;description: &g=
t;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A d=
ictionary of DIMM SPD Data.</span><span lang=3D"EN-US"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: ???<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"153%" style=3D"width:153.32%;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"1057" valign=3D"bottom" style=3D"width:793.0pt;padding:0cm 0cm=
 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"168%" style=3D"width:168.62%;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"1637" colspan=3D"2" valign=3D"bottom" style=3D"width:1228.0pt;=
padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:7.5pt;font-family:&quot;=
Verdana&quot;,sans-serif;color:#1F497D;mso-fareast-language:FR">Kind Regard=
s,</span></b><b><span style=3D"font-size:7.5pt;font-family:&quot;Verdana&qu=
ot;,sans-serif;color:#005493;mso-fareast-language:FR"><o:p></o:p></span></b=
></p>
</td>
</tr>
<tr>
<td width=3D"21" style=3D"width:16.0pt;padding:0cm 15.0pt 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"border:none windowtext 1.0pt;padding:=
0cm;mso-fareast-language:FR"><img width=3D"70" height=3D"24" style=3D"width=
:.7333in;height:.25in" id=3D"Image_x0020_11" src=3D"cid:image001.png@01D8FE=
7A.DC958000" alt=3D"Atos logo"></span><span style=3D"mso-fareast-language:F=
R"><o:p></o:p></span></p>
</td>
<td width=3D"1616" valign=3D"bottom" style=3D"width:1212.0pt;border:none;bo=
rder-left:solid gray 1.5pt;padding:0cm 0cm 0cm 18.75pt">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Verdana&quot;,sans-serif;color:#0066A1;border:none windowte=
xt 1.0pt;padding:0cm;mso-fareast-language:FR">Francine SAUVAGE</span></b><s=
pan lang=3D"EN-US" style=3D"font-family:inherit;mso-fareast-language:FR"><b=
r>
</span><span lang=3D"EN-US" style=3D"font-size:8.5pt;font-family:&quot;Verd=
ana&quot;,sans-serif;color:black;border:none windowtext 1.0pt;padding:0cm;m=
so-fareast-language:FR">Team Leader&nbsp;&#8211; R&amp;D, BDS<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ver=
dana&quot;,sans-serif;color:#005493;mso-fareast-language:FR">Atos France<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ver=
dana&quot;,sans-serif;mso-fareast-language:FR">Mobile: +33 6 21 43 11 21<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><a href=3D"h=
ttps://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.yout=
ube.com%2Fwatch%3Fv%3DP5g8tSWkCkU&amp;data=3D05%7C01%7Cfrancine.sauvage%40a=
tos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d=
5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DMs2gu2PDvBD4Ogl0AhLpF1HllKl3s3kuv6Gw63nHDbc%3D&amp;reserved=3D0"><b><spa=
n style=3D"font-size:7.5pt;font-family:&quot;Verdana&quot;,sans-serif;color=
:#0066A1">R&amp;D,
 BDS</span></b></a></span><span style=3D"font-family:inherit;color:#4472C4;=
mso-fareast-language:FR"><br>
</span><span style=3D"font-size:8.5pt;font-family:&quot;Verdana&quot;,sans-=
serif;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-lang=
uage:FR">Avenue Jean Jaur=E8s&nbsp;&#8211; France</span><span style=3D"font=
-family:inherit;mso-fareast-language:FR"><br>
</span><span style=3D"mso-fareast-language:FR"><a href=3D"https://eur01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fatos.net%2F&amp;data=3D0=
5%7C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C3=
3440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C3000%7C%7C%7C&amp;sdata=3DNEcchSNjDs2j1pcXCrru2MeIz5Uii38xg5HJEbPFQ2E%3=
D&amp;reserved=3D0" target=3D"_blank"><span style=3D"font-size:8.5pt;font-f=
amily:&quot;Verdana&quot;,sans-serif;color:#0066A1;border:none windowtext 1=
.0pt;padding:0cm">atos.net</span></a></span><span style=3D"font-family:inhe=
rit;mso-fareast-language:FR"><br>
</span><a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fwww.linkedin.com%2Fin%2Ffrancine-sauvage-consultant%2F&amp;data=
=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff416c998708daa60de5f6=
%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C3000%7C%7C%7C&amp;sdata=3D7EnlnxDQG8AUgBlflxPI3uj9rUlQ6RfFTYAb3Ltdz=
zE%3D&amp;reserved=3D0" target=3D"_blank"><span style=3D"font-size:15.0pt;f=
ont-family:inherit;color:white;border:none windowtext 1.0pt;padding:0cm;mso=
-fareast-language:FR;text-decoration:none"><img border=3D"0" width=3D"15" h=
eight=3D"15" style=3D"width:.1583in;height:.1583in" id=3D"Image_x0020_12" s=
rc=3D"cid:image002.png@01D8FE7A.DC958000" alt=3D"LinkedIn icon"></span></a>=
<span style=3D"font-size:15.0pt;font-family:inherit;border:none windowtext =
1.0pt;padding:0cm;mso-fareast-language:FR">&nbsp;</span><a href=3D"https://=
eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ftwitter.com%2Ff=
sauvage&amp;data=3D05%7C01%7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff416c=
998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C0%7C0%7C6380048758597=
07377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DzUWVIquoEIy%2FDH1HSFRPEBN=
DDTF29tvWkONSvtqkfXc%3D&amp;reserved=3D0" target=3D"_blank"><span style=3D"=
font-size:15.0pt;font-family:inherit;color:white;border:none windowtext 1.0=
pt;padding:0cm;mso-fareast-language:FR;text-decoration:none"><img border=3D=
"0" width=3D"15" height=3D"15" style=3D"width:.1583in;height:.1583in" id=3D=
"Image_x0020_13" src=3D"cid:image003.png@01D8FE7A.DC958000" alt=3D"Twitter =
icon"></span></a><span style=3D"font-size:15.0pt;font-family:inherit;border=
:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR">&nbsp;</span><a=
 href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.facebook.com%2FAtos%2F&amp;data=3D05%7C01%7Cfrancine.sauvage%40atos.n=
et%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d5a%7C=
0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DL1LD=
aAUjf%2BpPOlU0K1rMHB5D%2FrvEomEgpM2Ghvpx4DY%3D&amp;reserved=3D0" target=3D"=
_blank"><span style=3D"font-size:15.0pt;font-family:inherit;color:white;bor=
der:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-decorati=
on:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D"width:.1583i=
n;height:.1583in" id=3D"Image_x0020_14" src=3D"cid:image004.png@01D8FE7A.DC=
958000" alt=3D"Facebook icon"></span></a><span style=3D"font-size:15.0pt;fo=
nt-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-fareast-lang=
uage:FR">&nbsp;</span><a href=3D"https://eur01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fwww.youtube.com%2Fuser%2FAtos&amp;data=3D05%7C01%=
7Cfrancine.sauvage%40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6=
b7c7412cbb730e70b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7C%7C%7C&amp;sdata=3D18CHBR%2B1ap1a8%2Fv35you%2FGKiB0XoG4%2F6UU2cL%2F17CE=
8%3D&amp;reserved=3D0" target=3D"_blank"><span style=3D"font-size:15.0pt;fo=
nt-family:inherit;color:white;border:none windowtext 1.0pt;padding:0cm;mso-=
fareast-language:FR;text-decoration:none"><img border=3D"0" width=3D"15" he=
ight=3D"15" style=3D"width:.1583in;height:.1583in" id=3D"Image_x0020_15" sr=
c=3D"cid:image005.png@01D8FE7A.DC958000" alt=3D"Youtube icon"></span></a><s=
pan style=3D"mso-fareast-language:FR">
</span><a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgithub.com%2Ffrsauvage&amp;data=3D05%7C01%7Cfrancine.sauvage%40a=
tos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730e70b0198d=
5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3Dur4%2Bou5o0JK2u6359ELCRwiSpG3ej%2BAW65DyqsC4NeE%3D&amp;reserved=3D0"><sp=
an style=3D"color:windowtext;mso-fareast-language:FR;text-decoration:none">=
<img border=3D"0" width=3D"17" height=3D"17" style=3D"width:.175in;height:.=
175in" id=3D"Image_x0020_1" src=3D"cid:image006.png@01D8FE7A.DC958000"></sp=
an></a><a href=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fhub.docker.com%2Fu%2Ffrancine78&amp;data=3D05%7C01%7Cfrancine.sa=
uvage%40atos.net%7C201b7a3a66ff416c998708daa60de5f6%7C33440fc6b7c7412cbb730=
e70b0198d5a%7C0%7C0%7C638004875859707377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DmRgv8%2FWZgU54cKGTQF9zARI9p%2BJOxESouwIGZpJCdS4%3D&amp;reserved=
=3D0"><span style=3D"color:windowtext;mso-fareast-language:FR;text-decorati=
on:none"><img border=3D"0" width=3D"17" height=3D"14" style=3D"width:.175in=
;height:.15in" id=3D"Image_x0020_7" src=3D"cid:image007.png@01D8FE7A.DC9580=
00"></span></a><span style=3D"mso-fareast-language:FR">&nbsp;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-size:9.0pt;col=
or:#90ABDC;mso-fareast-language:FR">TT: [Wednesday or Thurday(2<sup>nd</sup=
> week of month) ] - Friday]
</span></i><span lang=3D"EN-US" style=3D"mso-fareast-language:FR"><o:p></o:=
p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span lang=3D"EN-U=
S" style=3D"font-size:13.5pt;font-family:&quot;Verdana&quot;,sans-serif;col=
or:black;display:none;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"684" style=3D"width:513.0pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:7.5pt;fon=
t-family:&quot;Verdana&quot;,sans-serif;color:#005493;mso-fareast-language:=
FR"><o:p></o:p></span></b></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span lang=3D"EN-U=
S" style=3D"font-size:13.5pt;font-family:&quot;Verdana&quot;,sans-serif;col=
or:black;display:none;mso-fareast-language:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"684" style=3D"width:513.0pt;border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:F=
R"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_--

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3376;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image001.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

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
pwAAAABJRU5ErkJggg==

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=663;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image002.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAIXSURBVDhP
bVNLaxRBEP6mH7MZZpKQxDUQUIKERATfKIgX0VM8mJsIPvDuH4h4COvNkwchd0EvnhTFiFdxQYnx
QTTegtmNj4jJktnHvHbH6p4Zlh22Dj1d3VXf93VVjcCdF49gWnPwW9BmMFo6yT5vXBqI4ypYeKHE
VjYFuLwK3+/GsxhgnNLom7cOgVrODLzmYTBQchCGgwNCPr1+Go2gjcuPl+G12wRg9GePQnUeqUUg
amNybBjnD4zp4PFhCz/+1lP2/vnZqYDk+PZrF/Ovv6MVdlD51yBckhcSO92B1Ggr0F6IHjTtcQr6
/NtFSEkxZ7h4bBxDpsC7Sg1XjkyA0RMefqiguk1FNbv5Ap0Yo5bA0o1TCKIY9t1XuD97CNN7bLh+
hMFCwnbt6AROPHiDFsV3ZdNO+SEtNU8XA9ut5Pt1q46Xa38wf24KB4sOju8bQXndVZXS1vuIFDIr
9K3nq1hZruLM5Chmp4vYa0vqYI45X1NmJG3yqICwTbiB7gx1r7d9fZkzMJ5K4LkkqqCm18kKT1Kg
Y6rJIjLVooyJZFpSjSwFKzAl22uKhXsLhlCZARWrvLGDXS/Sd+83a1pqXckVHF+ojUW7gK1GoCfP
2fg4NQOUaUik3GkGOLv4Ni0hw80nn5LR5oTsmLi9tJb4itkeQn3/yfVLpZJLfW4/gxyYQ5z+VYne
BCh7a+YLmhC/+RMFrKrr//fjuZXP4ZXnAAAAAElFTkSuQmCC

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=624;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image003.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAHwSURBVDhP
jZPPaxNBFMe/szPZbNqmjb+wBipCwNqjJ0EPnooKQsWz/Re86NleeyqeRBBPxWsPIhW8eKkgohYK
Cq0iorRBi+2mMdnd7M5M35uEmKSH+JZdltn3ee/7fqy68vTTDemPLZs0PmGNxjATnoTw83smSe4o
WLFiTRZYnQFCDGPBfkKr4/SyooSUgWnFDrT2KB9lBpm2KOQ8F1vSg/2FUoGymqR2MibagHMHynMK
mqnBzKkCysUcPlYboDjQlMGSF3OKnTgjH92/PInnm6FzFHTNVsaxdP0slCewU29hvdrE4loVhgCP
EjqYLUotpk8GeHz+HJ582MXqlxA3p0sOZCsXfaxu1dBoGRQ6yrowK/8etnDxzCjukYK7l047Nb22
9qPe1xcHM8hSqiQtpebkpHA3femy9UST9BS+O29bNzM36dnGHm7NHHMSB+3FVujgUiCPwlzbAUVf
eL2DB1fLmJr4F+DzboRH735j1G9PoS+z7Qx47kIJ1yoTXZBH9eprDQ/f/kKT5jRC6nq70KmZBk8B
3m83EEYaLwmICPy2n7ibSxoEXc20YbBZ5uZWI9lvfv6lZaA1oL7kqTnj+XaNfX2nRLRh4A2LPT9w
K8oBRnJD9psXxA9g0iRWEPa28NSykOr//ipJiKf+QMTzhwar2PjRdxjwAAAAAElFTkSuQmCC

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image004.png"
Content-Description: image004.png
Content-Disposition: inline; filename="image004.png"; size=530;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image004.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAGSSURBVDhP
jVM7S8NgFD3plzRpq31bdHHTQYouxUUQZ10VXHQTRKSzo3+gu7jo4qCLiN10UsTBQlGHWqiCgyjY
gkrFNubhvUkVoU31QPg+knvuOfcReWr54MIn/BnL1NENtu1+lSSA4kHxBdkhGk33bQdYlo36xyeE
T6IQCXRAU21KoGZkR7EL0STywvQwxkdS8Cs+FErP2M6XEVB1yN2svpNidn4Ui0T+hqYKbO6XiAxv
smnaiIZVzEwMOryrSg3503tUXxsIaq6mp3JDNxAMaI5Vxu5RxbHbnwgi0uMHN7CNzE3l8IFkCPEI
eWshFQtgbCgBRRZ4qTepcVI72TQtaJqCjbVJJKMaZOEqr86lsTKbxt7xLXI7l466p+1wSCEVl8gQ
lETQWaOaWyNvJ/M8dcNENneGODVsfSmDUEDB1uENToqPDrk3qHRuGC8CN6NYriJGZIPKYNw9vOH8
+gl9VLtCLljd0zaPgx9OxlD9wnHAPfC0/VPkPy682+i22x1zUF0+WQXvdoEuf/5Vv5MwkXlftu2C
5gLVKzUAAAAASUVORK5CYII=

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image005.png"
Content-Description: image005.png
Content-Disposition: inline; filename="image005.png"; size=623;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image005.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAHvSURBVDhP
hVNNaxNRFD33vZeZTEpTUhRpIXVR6N8QdeHCdUUoooJSCf0NLlyI4tqPdRYu9QeI+hd0GQoqtFjB
kEkc6DSTmXe9N5l8WCse5jEf95x735x7n+OtrTDJ+KUF3RiyrzIg19kggEKioWe8Hf3q3ne9oX+x
6tzdOM//rSpzadYhc63h3E6vfs46Itzql0KWO0YjwHupr3uQJYTJMkClIsuhJzx5u+mY2bIE+OQE
VK/Drq8DSzVQEADWAkUBzjLg+BjF9yPwYACqViUvw0lKjzQ1dnMTy6/bsBvNSaXTEHJxeIhk5zaK
zj4QVVUsu5OslcuXYC9uzCXTLU+/SELbbCK4egXpp89zscbNauOPWunzV7LFPqK9FmhlZRajhvDK
fowrj6FmLIB/dpE8egjfi7H09DHIlVQxbIr5k7q8ALpwHstPniFq7c6FGl/gzcRaYRFR68Hfpqk/
cV8MnYTGYqrVMPrwEcWXOzBiGmmLToGlZf7gANm794DwSzEbRBGKr98wuHYdZm1NkkWA9FmTqAjS
Z05T+KMf4CQRpyMY7TOBcmIOfBiOCUWnIxOm0yVTNoX23UwmjIQnfGjUCa0ts3pPZxvi6MzVM/5Y
O6S/K3zERd523dDsVbLChWS25VQF/z9VJkvy/E1s/e5v6x7I+ZCd+icAAAAASUVORK5CYII=

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image006.png"
Content-Description: image006.png
Content-Disposition: inline; filename="image006.png"; size=600;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image006.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASdEVYdFNvZnR3YXJlAEdyZWVuc2hvdF5VCAUA
AAHPSURBVDhPlZKxamJBGIUvIjayRDAaoia4xi2yhYig7CMoyRMESRkkTUSxEmyynVX2Aax9ArEV
kaiIhcRtFQXtVBQ79aznz3WiWbnsfvDDeOaco+OMhk/UajWk02lEIhF4Ly9luKbGvWOoktVqhcdE
AmcOh+HQQ+8+UkIxGo0eDR0beveLpCTx8CCbtzc3aLVayOVyCAQC+LE9BsftciGfz6PRaIiHXmZ2
aM1mU31DKpUScbFYYLlcyprw82azkTU9Oz+zRNv/H9rttohGVKtV5WeWaKFQSATX+Tn6/b6IRgwG
A/EywyzReF4KwWBQhH+BXmaYJZrH7RbB5/NhvV6LaAQ9X71eyTBLND4kCpxSqSSiEeVyWfnD4bBo
WvLpCY7TU5jNZjjsdtRfX2XjGI16Hd+vr1VJMpkUXet0Ojj5cgKLxQL7tsRkMsFqtarrI5VKBU6n
U4V30+12ZV8e2+7uf7+9oVgsIhaLodfriYHw6m0220FBNpvVd/USwpfov7rCcDjEbDbT1Xfm8zku
PB5VcB+P6zvvqBKSyWRwtv3Z3/x+jEYjXQXG47Eq+Pn8rKsfHJSQXy8vcpzJZKIrwHQ6RfzuDoVC
QVcO+avk/wH+AB6TTgm/9Q5CAAAAAElFTkSuQmCC

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_
Content-Type: image/png; name="image007.png"
Content-Description: image007.png
Content-Disposition: inline; filename="image007.png"; size=656;
	creation-date="Tue, 22 Nov 2022 14:19:48 GMT";
	modification-date="Tue, 22 Nov 2022 14:19:48 GMT"
Content-ID: <image007.png@01D8FE7A.DC958000>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABEAAAAOCAYAAADJ7fe0AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAASdEVYdFNvZnR3YXJlAEdyZWVuc2hvdF5VCAUA
AAIHSURBVDhPrZLLaxNRFIcn1dSg0J2gf4VuFNSFSxVBorRuimA3bqoLqQvRvbhxY2Jr0sTiwo3E
B4JpGkN9ER9QKYo0EdI0aZpMMpPElljbksfnvXcmMVZBF/7g8DvMOfebcx8a/0F/hYy8X+F8/Cut
Vsv+As2fqVIHIptkrSm8IbrafupZhWOTJk2Rd3F+0W+TXBB/3Xs/R3/U5NDjAu4pg+MR065CvdEi
kql1ppGuIDLJf6uTrG5w5W2FE08LDL8qMzClc3baZDBm8KW6zpLo+VBaQwsW8X1eURCpziRX31Xo
C6Q5Oamz/0GegViZg48KaitHwgZ7QjruWJVZY52tgRy7gymORipcn122IOHsKiPxMu6wztC0QX+k
yNBzk9PREmfsSQZjJc69LHNtpoJrNInmz9IbWMTzyYbsnMji8GXYEVig1zePy58Wnla+zQ6XX9bS
aL4s2miKGx+X0cX2pBRkXyhHz1gKx805HJ4EmnAVHtvtcHrn2OJb4MDDvFosJW9RQS6+NqzxvAkF
2Rw93qQAiFz6eJa4/l09iUZTcSxIQtxKXzCDNjavQM5b1qJ29MiJbmfYfifH3YR1K91vRkGkQqka
u+7paOM5tEBexFLHneKcDj8pEV1cVb1yC91SkPangjioiWSNy28Mhl8UuRQ31OnPmBtq/LW69ao3
qzPJn4r/JvgBYIEli4jlAtMAAAAASUVORK5CYII=

--_010_PAXPR02MB768073FA27508BD2B28EC72FE40D9PAXPR02MB7680eurp_--
