Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471C6EC442
	for <lists+openbmc@lfdr.de>; Mon, 24 Apr 2023 06:11:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4Wsm21lqz3cLC
	for <lists+openbmc@lfdr.de>; Mon, 24 Apr 2023 14:11:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=sX/KSCPP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.177; helo=smarthost2.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=sX/KSCPP;
	dkim-atps=neutral
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir; Sun, 23 Apr 2023 18:34:28 AEST
Received: from smarthost2.atos.net (smtppost.atos.net [193.56.114.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q41lS5Fmnz3cGk
	for <openbmc@lists.ozlabs.org>; Sun, 23 Apr 2023 18:34:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1682238869; x=1713774869;
  h=from:to:subject:date:message-id:mime-version;
  bh=rPYE8xP6KCF1H3eSyP+h36sXR/+AQhM1J9YVVYUWvF0=;
  b=sX/KSCPPiy2mN6OdThuZ0EB2qSA03p/UqRJOW9EVzeqX7f1Kp9ROXLqO
   7pWsz5D02NfANsDJ1AEJCJ6f6vXz4GDaFYgaT6fjYwvRV4bM/rmasiGVN
   rjweBxiZxzqAE9nDFZbSkk+yHwlRwhT15yLE3MKcYfoc0rdKy9kdI0xWK
   jEE1liFA4nikMDfHe9voEzrO/wLjU13OgvcYKMVjtZIAGF/L2J2xKtLN2
   yhsSQWl/I+nK8QQlk6Se1TuHsJ+0aU9B3Xn2fdAwBdVbrwxx82dLQlmjV
   ibdSUFW9UyaYo7rHRhmk3hsb+FFvXv3IWT4kp3QJjAM+3jMNk2ySIa9A9
   w==;
X-IronPort-AV: E=Sophos;i="5.99,220,1677538800"; 
   d="png'150?scan'150,208,217,150";a="506889141"
X-MGA-submission: =?us-ascii?q?MDGw/XK36K7r8G7nRaT4KlowOhYuKmj++LNoUs?=
 =?us-ascii?q?tsrr39cmdwWRhmbWrIjplDkJKhqyMrqrbLJkJKOSLHYJqHTQKzdZOr8B?=
 =?us-ascii?q?IC2KsLmObvcQAZannTlNyBlaQ0G2eW1YBQPAfIul58I50m4Qo1IyAIgk?=
 =?us-ascii?q?/v?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB23.ww931.my-it-solutions.net) ([10.89.29.133])
  by smarthost2.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 23 Apr 2023 10:29:13 +0200
Received: from GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) by
 GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 10:29:12 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 10:29:12 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8wXgxRYAhq1g4D/7T3Aur/BodjMlWL5WRmGZ21PFhXiFOvy/nDtPPqK3Xji2eOhESKpr+HiRwjOSnzUT0lN4gq1sIJkSC0Y7LbiDcVRcJdB7Fob/2l9DRg0MsR5lFkSyINqH87u+ksJSm3Li++El+6WE7Mg4Q4BkRNmChJPOhNPiHfrBOLBsXZjD/bQrQkPqon/IFW5XOj2mBgyXIkacYpMHYb4gFPBKnSYzYyF01w59eojgGltdly/4wmfipvcEd81LdZiBgcTzOxEd3LaqJSwZDNYCa5NR+jajnh0vLeVNwZXG+j8eL8OuGTyVjbLdch9yi1tsQ5Qxh/iFrBqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPYE8xP6KCF1H3eSyP+h36sXR/+AQhM1J9YVVYUWvF0=;
 b=huFPZwDfFM+p4lIVmo7kBiPSvFScPaCilvYT2H0YdFbo0XSJavt4vr1Dzj9u8O4JJgL9hqU2lofNx8LRafQ/A9IzMVBq8uzqF4agP2NFe+4bWNZOpgZihd+F0jjtlSpY1TuVVla2Q/mXm8pZETLrrlX1lJZo9qwP0IFS/1tRrRJ3/lcwJP0HGiSZqcUD9ZX6bV/VzJpKosgH9gVEGNhijcz3H59fRf8qcz7Kn59QRDm/ocboSNIJ6s0I8+5wrq527M93P3UGT6H0IQ2+wMxncFZtP48qyI5kJ941Q+k4kj2569SDIXmB+5EzAZCus7F0LupItKl0yZ+IoGlVtIdBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by DU0PR02MB8218.eurprd02.prod.outlook.com (2603:10a6:10:312::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Sun, 23 Apr
 2023 08:29:04 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::a438:f0b0:6d02:a891]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::a438:f0b0:6d02:a891%5]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 08:29:03 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: return error on property changes
Thread-Topic: return error on property changes
Thread-Index: Adl1vUaUxJKcmM5bQeWdcgU31K+qYA==
Date: Sun, 23 Apr 2023 08:29:03 +0000
Message-ID: <PAXPR02MB7680989DB7CF5B5C47627599E4669@PAXPR02MB7680.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2023-04-23T08:25:49Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=61b8c182-a7ba-457a-b2e3-e2f1304f8ac4;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|DU0PR02MB8218:EE_
x-ms-office365-filtering-correlation-id: 4c9347ee-7ec0-47fd-a0f0-08db43d4cbd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: baaGBNc6OJHMsaz3mUWRdUtXno8GX3vTuAySYF37YoEVhaZSPoZZfTKalw+TROkl8rhW2US/2eO8mDpF8npnAPMVg7IivJdFi5f6TGwvfMTD0ObLkHYmxEzggthr22Nu5mlheAf5nFnI+GOydDXTqOtCpLoJcbDlbNMlVGbFGY779oDEN9iv/PrOO6ZoPpsy6f5Q60fjQfXvDeeYH5mMMvng+sDX6GLHhg9wJ6/BCU8XIhrsdGorOAza9ggu6gDbOBg/ZPBlyB5rGOBLe5KZ5hgc57gHr1y38EIX0pop+JJB/aCb/cV/rbd18O4QkX35bM+AFRK6b2pO8vkqRgPDKMStAw9s8WuykT57DgWmh//wp6b/ysllBBOUPU7vJD19hcQtH8pdmFwkgJQoWPaeZPI1XPFdV6GyttVuJDspk+kduIoLuJiDgQFz61HKWHjOibTR64vRUKkDxNmSXAIQnOfX5Coeqhh27dHyEjU95v3V/bC7vUks2HBO/ueQhFso+D/XxaYgMityyiHpJAnHCzWdtvc8PSijZhElibxk/fIcB9BlP1Pk97Y/jfMsoTvXUQd8vmREdXU+dk59j/GLGwq2Ued9v1lhKb8GP3h+RqEdApiZ0nzq9i/LwXhqZMLEwzjvRpMqIUDA6d8fVzXp8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(66446008)(66556008)(66476007)(64756008)(66946007)(6916009)(316002)(76116006)(7696005)(55016003)(86362001)(71200400001)(478600001)(52536014)(5660300002)(26005)(8676002)(166002)(8936002)(66574015)(99936003)(122000001)(4744005)(82960400001)(44832011)(2906002)(38100700002)(19627405001)(83380400001)(33656002)(41300700001)(9686003)(38070700005)(186003)(6506007)(55236004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?STzLn6QiveHld/UlQymIrMtYwJBzemW91ZYAIOGK8rJVksodVvgU/iVvX6?=
 =?iso-8859-1?Q?0BiAL+BLHz0oEqHZ5X9WMyzsCJV8T/6zlH7feLhHKTS958O01nJW8VB6yu?=
 =?iso-8859-1?Q?Pz25tCcLJN3l79NaFQfX2PfyPFOfZU6vBKR17OEkT2Yoi6OoxeJEbWV+C5?=
 =?iso-8859-1?Q?ZCChQrLlfimQq84SBwAgrxKlYzptoR4znDFgVa1Rdn3vOruzf4CdQvz1XR?=
 =?iso-8859-1?Q?YCw+kUjShJzE5b2/sZKzwwWuL63sbA2yJebDZoZkRNTm4twxsqAXSO5kJ6?=
 =?iso-8859-1?Q?7v1z6Cbc3o2GKOwL4REfHs+blq4Wtr/Y/wYMPsUStVwvy9erOL7JtMqvPI?=
 =?iso-8859-1?Q?u9z8CR3BW9LOJI7C3aNZP+qgERDbtVkoUrqHoYnV6sHWvx6wQMgIyH5XfH?=
 =?iso-8859-1?Q?kJRV/iRR3BhSGmTE++KmiIHEVSmQqaG93dkTfEM8eB+FvvJPfV4ivus0J/?=
 =?iso-8859-1?Q?D1jimtx7UWE5dT0ch616xOhhyyViLlkRramjS9QbBNRYo24srzvU/Vvplf?=
 =?iso-8859-1?Q?WbbEuhzfwDR+hUqhHFXmGXsxkbN34waB+7WQDbHmqnLrOxfRyk/S/n2p7V?=
 =?iso-8859-1?Q?3MCWiUghJt7A40yqlkPD3+54ifV42mh699BxmIDHJMb7vzxad4uZVUHSZk?=
 =?iso-8859-1?Q?bc30tC13T0LFPRCW4ogRTPjMXm14STdLXUg/wpUHCiOL92B7usNTxQkDeO?=
 =?iso-8859-1?Q?kWJF2Yh94CTWXi/zl4Rig7wbIkXCD7hrWcXkNCxhrnhDPBLbsGy7sblJIt?=
 =?iso-8859-1?Q?gT0bDVwroQ4y7Q921Vz/GYCTHqE4XTLT4N/2jOaArUtN75oLlliGlyl29X?=
 =?iso-8859-1?Q?GNrUU6SBS3reK7e3lR+RMag5KdDoM8vg5ssxk3EivQNmHie9CrEhxJXU+1?=
 =?iso-8859-1?Q?9+BC8Pe1ihGAdBNHjdTwsaaFHVa+6KQFrLnfbke3OPvAax6MeCq/BEPczw?=
 =?iso-8859-1?Q?7owP5ndWVakFonXyLg5t29GjYiIAalxrV8LG6XbgJ4dn5SwmHwSfDS+R7y?=
 =?iso-8859-1?Q?FyDl+RA0zKUaKJa8i+bULjDhWI72/ORfsoO+Ai6RH5BcWfOjIl54c6uopr?=
 =?iso-8859-1?Q?idi8ia9i+JW4asOKo+sh0cEZ4vrP875CERjsVWax9orkWUZbdZczONsmmO?=
 =?iso-8859-1?Q?7CsyhMiCAlTUDla8N3htvD6Ck4pgyAShSjGRuAzqmHKzp3lYfBu7JbLbGh?=
 =?iso-8859-1?Q?tUmZDCEyAZxVC9RwqSpPq/SZ7Fhnk/NuUklDYqxpfZmCz7e44tC6+a2Lf2?=
 =?iso-8859-1?Q?uwEFK8gx283P666WQi5xX7jRYDwkA6kU2VSDD11Qunl4VyqFiZGz3+prAP?=
 =?iso-8859-1?Q?NSC2kxHN87sxx3Wmx8mmuCd58sD0sOe2w5dtvItRKBxXqZ4XQ5jvHMAhyg?=
 =?iso-8859-1?Q?PdWxz83VavQ+R9Qd8doIDSvBaG9i5iaVAOIHiph9RZf/FNoAteoQNK/uJb?=
 =?iso-8859-1?Q?8wcBeXhDwXa6X0dzcGsOB0C/0bJbVs0TeGv/+O6KMT1FNfkU1wrbv++H7B?=
 =?iso-8859-1?Q?WfCyN+oG2lrnriupdsSyDcftnYeHe7VSWgpjRrOaryCBA9YGL3t6NN/NHt?=
 =?iso-8859-1?Q?y8vDjS5CPudxOUxS+YseMIPRks0rURORxN2V+v7kAfQ0wAbHFuD68H5JwB?=
 =?iso-8859-1?Q?WPHghgGIiCC3S8LBLsvSYL2GbgXLRsbSbp?=
Content-Type: multipart/related;
	boundary="_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RD+SXC/iKy6UmYf3OFkEgAzdwT1OtMkQqJTsBoabXOcp/Pix0UQ02GluUgNPIh2jRUAD2xnaECp10IzLnOcRT38fCq6MgL/mW7qU+1Etuv0R0kQ6IltJugUsl4Z8l3XfBtrgrjSoiyrDBtyr0uZM1yQys/LcWTRJtzhJLxwrnKT7CE29sAhjkT3su/6auh4DATeG/npaHNPMkzBUzo3R50qlvEwXqREqpfYTHsJsgj/Ba0Jh0hgiY6K5z6uMnbSZp6WrcWyEwaIfVhtiKhPBydHN+uJu+42a7fREhPLk1wQTjK9zxoHZvrs1CgGdKD3ReeGgTePTxnrIcXiTSyuaSm2Ku8cDmuY44At/l6vX8mv9FoLI+jTko3SbVYD9G5lvoLRaKMm9m4D7xRt24Sv+G2yzpaCeMIfP+i2lpPixUkbfIHiAyJ3dlfU/115pmCqkHyz9tyv1KppNaKv7vZr43TlnkwSP4WG9r7KREh20MdT7xHGNEgCUhi80eTpyUhmNAY+MAmZLvyfTcWOU9WRjJALoBMoj6zixUNMsp7yg3NjWUT5sncHVXWtoZESMSksm1Qh5Yd5Bs1GpuiXVnz+93MS1YLrdEWf/1LVnTXk/hk0dJviIFAZA84rOUZn3Q5JMFWeYqcHPygPO4L7wjTPxI+m4owgAEPCTFIbxR/P3QKgeRnePFdKMxkSSvaUkw1T9s4SaeA23YiRtpICDd/VZ7qrnk+jy8P45rEbjlDtYAekrTawedCuZTqDIH3KmpfVfw1iV/b4iTBDTQ/hX8TrZZ5F5hixgbrbnbEc9bKxJnqVIfdwejgk+jjaOF4iXt8GslDR2inJxkDdO6FPIeamVYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9347ee-7ec0-47fd-a0f0-08db43d4cbd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 08:29:03.4331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ud6Im4Voiu/4bPPZXTev50IhjeHcKcVMVBhwhmNQZ0ZSVrLLqRIxA58noRVzeHCPzoZ0C1gW9aMnucwzLycN3ESQcikJTAJoGSAaYZdNWfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8218
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:10:20 +1000
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

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: multipart/alternative;
	boundary="_000_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_"

--_000_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I cannot implement the following use case:

From bmcweb code, I set RequestedPowerTransition.
From requestedPowerTransition (phosphor-state-manager) code , I have a bad =
condition and I reject the transition.

=3D=3D> How can I throw something (error code, exception ?) back to bmcweb =
in order to know what happened exactly ?

I was not able to add a "exceptions:" part in yaml around a property to cre=
ate and throw a specific exception while getting / setting a property, like=
 I did with methods.

I need to declare (and return) an exception while a property is changing, e=
specially when the transition is not accepted.

I have an old version of openbmc, it may be solved in the new version, but =
please tell me how to help me eventually patching the needed parts,



Best regards,
Francine


Kind Regards,
Francine Sauvage
Team Leader - BDS-RD-PFM
M: +33 (1) 6 21 43 11 21
Av. Jean Jaur=E8s BP68 - 78340 LES CLAYES-SOUS-BOIS - France
eviden.com<https://eviden.com/>
[LinkedIn icon]<https://www.linkedin.com/in/francine-sauvage-consultant> [T=
witter icon] <https://twitter.com/EvidenLive>  [Instagram icon] <https://ww=
w.instagram.com/evidenlive>  [YouTube icon] <https://www.youtube.com/@Evide=
nLive>  [cid:image005.png@01D975CE.6BC3FF20] <https://github.com/frsauvage>
[Eviden logo]

an atos business




--_000_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
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
	{font-family:inherit;}
@font-face
	{font-family:Montserrat;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Montserrat SemiBold";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;ma=
rgin-left:0cm">
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">Hi,<br>
I cannot implement the following use case:<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;ma=
rgin-left:0cm;box-sizing: border-box;font-variant-ligatures: normal;font-va=
riant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-text-strok=
e-width: 0px;text-decoration-thickness: initial;text-decoration-style: init=
ial;text-decoration-color: initial;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">From bmcweb code, I set RequestedPowerTransition.<br>
From requestedPowerTransition (phosphor-state-manager) code , I have a bad =
condition and I reject the transition.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;ma=
rgin-left:0cm;box-sizing: border-box;font-variant-ligatures: normal;font-va=
riant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-text-strok=
e-width: 0px;text-decoration-thickness: initial;text-decoration-style: init=
ial;text-decoration-color: initial;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">=3D=3D&gt; How can I throw something (error code, exceptio=
n ?) back to bmcweb in order to know what happened exactly ?<o:p></o:p></sp=
an></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;ma=
rgin-left:0cm;box-sizing: border-box;font-variant-ligatures: normal;font-va=
riant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-text-strok=
e-width: 0px;text-decoration-thickness: initial;text-decoration-style: init=
ial;text-decoration-color: initial;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">I was not able to add a &quot;exceptions:&quot; part in ya=
ml around a property to create and throw a specific exception while getting=
 / setting a property, like I did with methods.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:12.0pt;ma=
rgin-left:0cm;box-sizing: border-box;font-variant-ligatures: normal;font-va=
riant-caps: normal;orphans: 2;text-align:start;widows: 2;-webkit-text-strok=
e-width: 0px;text-decoration-thickness: initial;text-decoration-style: init=
ial;text-decoration-color: initial;word-spacing:0px">
<span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif">I need to declare (and return) an exception while a proper=
ty is changing, especially when the transition is not accepted.<o:p></o:p><=
/span></p>
<p style=3D"margin:0cm"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;Segoe UI&quot;,sans-serif">I have an old version of openbmc, =
it may be solved in the new version, but please tell me how to help me even=
tually patching the needed parts,<o:p></o:p></span></p>
<p style=3D"margin:0cm"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font=
-family:&quot;Segoe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10.5pt;font-family:&quot;S=
egoe UI&quot;,sans-serif">Best regards,<br>
Francine<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:100.0%;border-collapse:collapse">
<tbody>
<tr>
<td colspan=3D"2" valign=3D"bottom" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:11.25pt;vertical-align:baseli=
ne"><b><span style=3D"font-size:7.5pt;font-family:Montserrat;color:#FF6D43"=
>Kind Regards,</span></b><span style=3D"font-size:9.0pt;font-family:Montser=
rat;color:black;mso-fareast-language:FR"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"100%" style=3D"width:100.0%;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Montserrat SemiBold&quot;;color:black;border:none windowtext 1=
.0pt;padding:0cm;mso-fareast-language:FR">Francine Sauvage</span><span lang=
=3D"EN-US" style=3D"mso-fareast-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">Team Leader&nbsp;&#8211; BDS-RD-PFM</span><span lang=3D"EN-US" style=3D=
"mso-fareast-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">M: +33 (1) 6 21 43 11 21</span><span lang=3D"EN-US" style=3D"mso-fareas=
t-language:FR"><br>
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:Montserrat=
;color:black;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:=
FR">Av.
</span><span style=3D"font-size:9.0pt;font-family:Montserrat;color:black;bo=
rder:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR">Jean Jaur=
=E8s BP68 &#8211; 78340 LES CLAYES-SOUS-BOIS&nbsp;&#8211; France</span><spa=
n style=3D"mso-fareast-language:FR"><br>
<a href=3D"https://eviden.com/" target=3D"_blank"><span style=3D"font-size:=
9.0pt;font-family:Montserrat;color:black;border:none windowtext 1.0pt;paddi=
ng:0cm">eviden.com</span></a><br>
</span><a href=3D"https://www.linkedin.com/in/francine-sauvage-consultant" =
target=3D"_blank" title=3D"LinkedIn"><span style=3D"color:#337AB7;border:no=
ne windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-decoration:non=
e"><img border=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;heig=
ht:.2083in" id=3D"Image_x0020_1" src=3D"cid:image001.png@01D975CE.6BC3FF20"=
 alt=3D"LinkedIn icon"></span></a><span style=3D"font-size:16.5pt;font-fami=
ly:inherit;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR=
">&nbsp;</span><a href=3D"https://twitter.com/EvidenLive" target=3D"_blank"=
 title=3D"Twitter"><span style=3D"font-size:16.5pt;font-family:inherit;colo=
r:#337AB7;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR;=
text-decoration:none"><img border=3D"0" width=3D"20" height=3D"20" style=3D=
"width:.2083in;height:.2083in" id=3D"Image_x0020_2" src=3D"cid:image002.png=
@01D975CE.6BC3FF20" alt=3D"Twitter icon"></span></a><span style=3D"font-siz=
e:16.5pt;font-family:inherit;border:none windowtext 1.0pt;padding:0cm;mso-f=
areast-language:FR">&nbsp;</span><a href=3D"https://www.instagram.com/evide=
nlive" target=3D"_blank" title=3D"Instagram"><span style=3D"font-size:16.5p=
t;font-family:inherit;color:#337AB7;border:none windowtext 1.0pt;padding:0c=
m;mso-fareast-language:FR;text-decoration:none"><img border=3D"0" width=3D"=
20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"Image_x0020_=
3" src=3D"cid:image003.png@01D975CE.6BC3FF20" alt=3D"Instagram icon"></span=
></a><span style=3D"font-size:16.5pt;font-family:inherit;border:none window=
text 1.0pt;padding:0cm;mso-fareast-language:FR">&nbsp;</span><a href=3D"htt=
ps://www.youtube.com/@EvidenLive" target=3D"_blank" title=3D"YouTube"><span=
 style=3D"font-size:16.5pt;font-family:inherit;color:#337AB7;border:none wi=
ndowtext 1.0pt;padding:0cm;mso-fareast-language:FR;text-decoration:none"><i=
mg border=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2=
083in" id=3D"Image_x0020_4" src=3D"cid:image004.png@01D975CE.6BC3FF20" alt=
=3D"YouTube icon"></span></a><span style=3D"font-size:16.5pt;font-family:in=
herit;border:none windowtext 1.0pt;padding:0cm;mso-fareast-language:FR">&nb=
sp;</span><a href=3D"https://github.com/frsauvage"><span style=3D"font-fami=
ly:Montserrat;color:windowtext;text-decoration:none"><img border=3D"0" widt=
h=3D"14" height=3D"14" style=3D"width:.15in;height:.15in" id=3D"Image_x0020=
_23" src=3D"cid:image005.png@01D975CE.6BC3FF20"></span></a><span style=3D"m=
so-fareast-language:FR"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"mso=
-fareast-language:FR"><img border=3D"0" width=3D"70" height=3D"22" style=3D=
"width:.725in;height:.225in" id=3D"Image_x0020_6" src=3D"cid:image006.png@0=
1D975CE.6BC3FF20" alt=3D"Eviden logo"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:Montserrat;color:black;display:none;mso-fareast-l=
anguage:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"250" style=3D"width:187.5pt;border-collapse:collapse">
<tbody>
<tr>
<td valign=3D"bottom" style=3D"border:none;border-top:solid #E2E2E2 2.25pt;=
padding:7.5pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:12.0pt"><span style=3D"font-siz=
e:9.0pt;font-family:Montserrat;color:#4A4A4A;mso-fareast-language:FR">an at=
os business<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"vertical-align:baseline"><span style=3D"fon=
t-size:13.5pt;font-family:Montserrat;color:black;display:none;mso-fareast-l=
anguage:FR"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:FR"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_--

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=1802;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image001.png@01D975CE.6BC3FF20>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=2165;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image002.png@01D975CE.6BC3FF20>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=2520;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image003.png@01D975CE.6BC3FF20>
Content-Transfer-Encoding: base64

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
AAAAAElFTkSuQmCC

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image004.png"
Content-Description: image004.png
Content-Disposition: inline; filename="image004.png"; size=1662;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image004.png@01D975CE.6BC3FF20>
Content-Transfer-Encoding: base64

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
AElFTkSuQmCC

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image005.png"
Content-Description: image005.png
Content-Disposition: inline; filename="image005.png"; size=600;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image005.png@01D975CE.6BC3FF20>
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

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_
Content-Type: image/png; name="image006.png"
Content-Description: image006.png
Content-Disposition: inline; filename="image006.png"; size=3190;
	creation-date="Sun, 23 Apr 2023 08:29:03 GMT";
	modification-date="Sun, 23 Apr 2023 08:29:03 GMT"
Content-ID: <image006.png@01D975CE.6BC3FF20>
Content-Transfer-Encoding: base64

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

--_009_PAXPR02MB7680989DB7CF5B5C47627599E4669PAXPR02MB7680eurp_--
