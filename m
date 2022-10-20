Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7312606B08
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 00:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MthdL4ZrXz3bnH
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 09:11:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=pYAQrPBQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.176; helo=smarthost1.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=pYAQrPBQ;
	dkim-atps=neutral
Received: from smarthost1.atos.net (smtppost.atos.net [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtY6w06Vnz3c6T
	for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2022 03:32:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1666283576; x=1697819576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qNbcqH9U1o5BakEIsYlJzn0jYwVqcY665krHJwpD5E0=;
  b=pYAQrPBQ3ioHCDAvOoVPED3QnvqrqGn2c+vOsQk9zLqbOjUp7gNPqRZ4
   lSymngLZUiQFg7zPS2GL/ShZ0a60NQEFg12j6WNS0hxhZhw8S/fQmyo4a
   T5Ni5DjfjzR8zWPJ8xzrk4QyDOZcOfXs9fwUsqbEmQsHArjhai4eu3MTr
   iZiHSF63B00UfzFIsaTrUuCLiG+JDY0nbNJZvGY4JFefOix5+tTHfd1uw
   MLaYZZdtnbVLP3kbcGD/djrreQaU8wAWDIF+nhyaHxEN5AaunVt8GgFn1
   uNvsDNWvbg2zOWC2JXFDwcxtvrxXXulJ7F+IbtdwQCTQjNLgs7kFBapwI
   A==;
X-IronPort-AV: E=Sophos;i="5.95,199,1661810400"; 
   d="scan'208";a="332500971"
X-MGA-submission: =?us-ascii?q?MDH3kRqnxXjCinRVL7JCl/RnXdLmtwnlXs1Mpc?=
 =?us-ascii?q?8hw0YjVCQCY3GjjZpBLcHj1mPm8szPfa1jSlGp3kodf3Tet+JtTUzV4s?=
 =?us-ascii?q?dUQJfZO75zWoJGqobBPWb8HXmx668c5IgRojH1YIQRbaMqG+MM8k2RaW?=
 =?us-ascii?q?Bh?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB23.ww931.my-it-solutions.net) ([10.89.29.133])
  by smarthost1.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2022 18:32:47 +0200
Received: from GITEXCPRDMB24.ww931.my-it-solutions.net (10.89.29.134) by
 GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 20 Oct 2022 18:32:47 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB24.ww931.my-it-solutions.net (10.89.29.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 20 Oct 2022 18:32:47 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZt1DHUNX6ZrrsLpUFKWEoUNoBXB5meAAwoyhWUAGg8BLIpbnE7+qCstPt9QfDt/TCXZlobaHVcYBd+Krzwd1z29lU7+kUkRbJQ9fJNOiNOkyGi3uLGRMdGEuCoTPg9qYsej0yJGZXCSghHeEGJ7fsb7x5/unXLGzUvLgYc0n+8H4fmYXOWtDtkUDGLD64SIVTsqjhscFgE0M4s4tZlUPTGQiG+31nF5NXVtHBbmBADgcaNw/AZA526j8O32YvKOzhjardYJHiuGHw8OLnhNwvrJWNz7IerhDzV/6AJFITJze8dMk8DAQ4Daf5danb82suHHl+NilOlRq+KADwU5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNbcqH9U1o5BakEIsYlJzn0jYwVqcY665krHJwpD5E0=;
 b=GfO/7WH+F624z+08xXYfIKl90sgAPgqAqz6cMIiFJ1CEDsVn3qH+Z5oVzN3MdBA+tiEnk+He5ucndmOwIJgRCYs2WcsOxQxAVlcHGvRxzuqZmy+NBqTbR0ellZSNnwHlq5HquH/R3Pms06lgiPtZirgWdtLM/hIneSloDzs/9RevlX3I67Ip37OZE6As4H0+6k+vO4RdI1PKO+zOHDHvuXf4IrBPZtg9xEA5bpOPrNo75scD2jzlQ6AdpDd2EmIIKxgNCDftaoVIlMchgm910pLa2IBgoP2xjCLKDHC0zZWRA6uxvVUaOJWmMtdWY9fo36oQ5xmr13XRpE/6+X20Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by PAXPR02MB7261.eurprd02.prod.outlook.com (2603:10a6:102:1bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 16:32:41 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3%8]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 16:32:41 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: compiler error : get_if<> with a variant enum ?
Thread-Topic: compiler error : get_if<> with a variant enum ?
Thread-Index: Adjh/8IAYnQ4mETfS2au9W7IhFbaOgAgaEuAAA+KbIAAeF4TIA==
Date: Thu, 20 Oct 2022 16:32:40 +0000
Message-ID: <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
In-Reply-To: <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-10-20T08:35:44Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=b168406e-b47d-40ac-839a-7c5717d13d19;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|PAXPR02MB7261:EE_
x-ms-office365-filtering-correlation-id: 514a9494-c788-436a-c2e3-08dab2b8b538
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N4voUi2UZM4un1poiESVDXTO4LE7/3JoKap9O37oCe73kR3tDs49kFsPQ3WKr9GM9SHJRfDl8NSnGPlx1mSgDyqjFj+61+vejeNrWVXahM4oKVSnCjmdZIpd2z24799XCTmyoj4oIQgCl7bwE8vArshbWuY2Izzlr9Zs1FNl/KPqNNYTOOEdRHYdNvVwfURVvd7lTnDg+4Ee0jkY/tx5bf3uZEnZmEwTZmX8lqMYzAx/SkFqaZ2FgoGfsQ5ikKYAdBdqGgQL2MhDGBYgTxzy8leiwLdeBjQH4me6+Y3JKnqWIoqfGo1+rdrM+P8NAH4yEFqgU+uJdtGzpr5vvaIiFPtd3MxluS9H+hu7/sTp3vZz6Jgba651HyYnkTXNChqB55w8LrPgdK/pPaKItbl9LoTY3bZLzGXKE3TZqmTcwd2xEySfv+dbqOdPkar8taY2na/eNkffebtStDJsJLXE7tWvPQeKDzl+jl8eUEJUVYrEZcB0Vkl0rykGguDmG6GVcdtQclBgv/k0RP0Pbn6XrMKtc/BxSemeiNMKwlX67HMsVJQH7blFtxO4+abTPqHWP6axzWzR+TCaJcaWMRgXA8SP87mZUiul0JibLdY7zJKbUDSUkM9EATQU8pBRko+dS7yf9spde1Jy/SSGgTHiTNpLm3T7zr8MalFQNuuUDL6prOaSL1bPuHVRZsOVS7OezxLehZ7nUbF11Qf+6MJVnMMxY8SedRZU+Ewt0zD1LHFCoQcpyLkEDJq9YPFMEWTuXMhcHleIWvHtjuPrf2hgKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(83380400001)(5660300002)(44832011)(2906002)(52536014)(4326008)(8936002)(478600001)(66946007)(76116006)(66476007)(66446008)(64756008)(8676002)(6916009)(41300700001)(316002)(71200400001)(55016003)(86362001)(66556008)(9686003)(186003)(2940100002)(82960400001)(7696005)(6506007)(26005)(122000001)(33656002)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CjGsSJzzslxVLiSWYZC449gRtCH6+w8vbH2nrAEoV6WfWeu+7cHz8BNy6i?=
 =?iso-8859-1?Q?bH78RjW80do3LUhjDtXw7GtuWnr4ZgPvM2CWxmQz7GE0lYn79oonL/EHSO?=
 =?iso-8859-1?Q?Xy6BfluDh/dHNTriX+lyiuN6KvSjsDeALyWPWQtY2GH8o9KsVaW6xF6B3D?=
 =?iso-8859-1?Q?p/rC5mO2N0qCkEW7wqBcxgjXDL2LFUMuzxiVenrWPJHXc9FulmRnVFfgMB?=
 =?iso-8859-1?Q?J8FDUmfyESOQoMYuIwUmd2iz1LlJsIuX6ygmcpAfxB6Co14aPTAzMAgMDY?=
 =?iso-8859-1?Q?5G/fHnE7KSehpLwno0j4FB+IcQae5o2Ik37Ta1UUaNQ0a4QbTXX/AgYfUQ?=
 =?iso-8859-1?Q?J36uQnVMSpL3I7qTb8nBS+RrwjK06Rv4sGoXph+KT/EyqZj+2fXDNJpx6O?=
 =?iso-8859-1?Q?YH+M7cIK2oXepWxurGduI7QbN2TiBKF8HguaiFEnmDNL+mP5VAxxcVRR60?=
 =?iso-8859-1?Q?YmJ5mov4GIJZXZ56nYMA2QSF+jPZD+3gqyG6/3wJ8GTbVRUZ0C6rcITOPe?=
 =?iso-8859-1?Q?sE5HPNM8rlE9vHskKeriDgVha/XGXeiTuOJVI/MDJb1iRbetp/ZLVswO15?=
 =?iso-8859-1?Q?GLek0ppp73Yc3EL9+EPScdZJlo9XIM4QJzhy7c3nYd8cRLctDpOnadVjeE?=
 =?iso-8859-1?Q?skrgMntOZOJVGjttXze53g/KPcI13ZtlbA+rquMrEF+b41JyxdP7OBoM3q?=
 =?iso-8859-1?Q?Z8Idjr/QpeBn3DSBc2CpvCUsqjgv0XNbjRO8/M7fjaI9QWqhr5g3wbTavG?=
 =?iso-8859-1?Q?rRexhNmy8Gr01WwYTmLG78L4ErDL9pGtagWPku6DWp4aEvQF8aZymgz2Yr?=
 =?iso-8859-1?Q?JEcQ2A32p111IhUDTXb3w3cqYZSutmr84l+WXONRd7KQ/7T/EWR91tl0bk?=
 =?iso-8859-1?Q?ujm6GDeiUM30M19miiai+bGvmYjV/JmjDKj3cPdu4QF95uSuBmGyQIgrJs?=
 =?iso-8859-1?Q?CgRXp+t7sL+eFnmgwYJZJLZKnZgH6f1e4QgUjQP3FWHBdEz1eqeULpcOXC?=
 =?iso-8859-1?Q?BS0XY4kus5hCsn4hEQmhSeAurIe6FrFEa3ey/IgL6FiWdJnjTFv1m2ijPw?=
 =?iso-8859-1?Q?xUM6ygKksp2w4iE2KEM/6Rsu6n2nhJbq1fZkB2kFqb08olbzRIE6bKz/Rz?=
 =?iso-8859-1?Q?PU2FoMt43pZ0gFxTsHIlE3NATKGsT4UEFqRTPlDQpzbpGcNdPTL0T8YEai?=
 =?iso-8859-1?Q?wOKlnnmdURtJWmbwI4sgcCmmCbma1Poz3D4LbvGNPdV8BzD77+Na4YTWKc?=
 =?iso-8859-1?Q?tIVPtRqRoxd8rXyxz29I1Xq2jWD8DOs1Fj98gJEhiicEhd5kFkpJ4W4MRp?=
 =?iso-8859-1?Q?PuLlxXDoB+96MghQdKPkIvYaIltqnOt5yaeitoYOZ7YmOveW1M4zUk2XaS?=
 =?iso-8859-1?Q?vmQQnH/TfLZXwp3mmJyV5yR2YLteZ0cmKsHMAvW4BPOKa4htgU6p4BKiEi?=
 =?iso-8859-1?Q?pFOgiTomun43r8A2GqkYTz5NdQadBzmltE1r8fwWSwrUIq7gzvlqJpZhl5?=
 =?iso-8859-1?Q?zfNxPbLt+bJp3RnXRDYp/9LAFROqyapVVsqxDHXUViSoZbWMOPIaAN2LTM?=
 =?iso-8859-1?Q?9lpY7/bVB5hnZZdoILFbOQhYIExizMRythfwPFu9ucezzZ+MSY1BI6wSWO?=
 =?iso-8859-1?Q?F9x6idpP0rVbadh8IQ/RA/prEe1RslGzwmhZyA8Hes7iuaDSv3b2p0Eg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514a9494-c788-436a-c2e3-08dab2b8b538
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 16:32:40.9999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/K2qONkr1hRnHgaBz97o4wc7OL3oOQ2aAmSlBEuElw7v4YcJmxNZTFBLp0ex+AyrzMTdrBZNhP2tGunh5rvHVU7izaTRVivxBU9BEXYS0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7261
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Fri, 21 Oct 2022 09:09:53 +1100
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

Hi Patrick

I was happy, I successfully added ModuleTypes in the variant lists:
It compiles.
But, I get a runtime error as all my objects are different:

what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString: An enumerat=
ion mapping was attempted for which no valid enumeration value exists.

Is there a way to add enum types to the variant of a ManagedObjects that po=
tentially are NOT in the object interfaces/Properties ?

Or is there a way to filter the objects in ManagedObjects dbus calls ?

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
De=A0: Francine Sauvage=20
Envoy=E9=A0: jeudi 20 octobre 2022 10:36
=C0=A0: Patrick Williams <patrick@stwcx.xyz>
Cc=A0: openbmc@lists.ozlabs.org
Objet=A0: RE: compiler error : get_if<> with a variant enum ?

Hi Patrick,

Many thanks to answer me.

I prepared a mail for 2 days, but ... I am still testing your suggestions.

I included the generated server.hpp but not the generated server.cpp as a l=
ibrary.
It could explain my problem.
I am not able to add my enum (ModulesTypes) in the variant list.

It should disturb the generated mechanism.
So I added the generated library (similar/specific phosphor-dbus-interfaces=
)

I'll let you know,

Regards,

Francine SAUVAGE
Team Leader=A0- R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS
Avenue Jean Jaur=E8s=A0- France
atos.net
=A0=A0=A0 =A0
TT: [Wednesday or Thurday(2nd week of month) ] - Friday] OoO=A0: October 31


-----Message d'origine-----
De=A0: Patrick Williams <patrick@stwcx.xyz>=20
Envoy=E9=A0: mardi 18 octobre 2022 01:37
=C0=A0: Francine Sauvage <francine.sauvage@atos.net>
Cc=A0: openbmc@lists.ozlabs.org
Objet=A0: Re: compiler error : get_if<> with a variant enum ?

On Mon, Oct 17, 2022 at 08:13:20AM +0000, Francine Sauvage wrote:
>=20
> const auto* flexible_module_type =3D=20
> std::get_if<sdbusplus::xyz::openbmc_project::Inventory::Item::server::
> FlexibleModule::ModuleTypes>(&flexible_prop_map_iterator->second);
>=20
> ** I tried to replace auto with=20
> sdbusplus::xyz::openbmc_project::Inventory::Item::server::FlexibleModu
> le::ModuleTypes>
> No success.
>=20
> Error is :
>=20
> bmcweb/1.0+git1.0-r0/recipe-sysroot/usr/include/c++/10.2.0/variant:115
> 0:42: error: static assertion failed: T must occur exactly once in=20
> alternatives static_assert(__detail::__variant::__exactly_once<_Tp,=20
> _Types...>,

What type is `flexible_prop_map_iterator->second`?  It seems likely it is a=
 variant that doesn't have the enumeration type in the list of contained ty=
pes.  "T must occur exactly one in alternatives" seems to be saying that `M=
oduleTypes` wasn't part of the underlying variant types.

--
Patrick Williams
