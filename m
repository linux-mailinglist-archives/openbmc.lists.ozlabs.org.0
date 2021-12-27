Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9047FA19
	for <lists+openbmc@lfdr.de>; Mon, 27 Dec 2021 05:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMl9320C8z3051
	for <lists+openbmc@lfdr.de>; Mon, 27 Dec 2021 15:31:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=g6yQEm2f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=399563d983=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=g6yQEm2f; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMl8c2dxfz2xWl
 for <openbmc@lists.ozlabs.org>; Mon, 27 Dec 2021 15:30:32 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BQGCsS5024714;
 Mon, 27 Dec 2021 04:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=mHA2q+xR92R8NC021xbDnoCOYrXGmHu3KgpHgKRu+f8=;
 b=g6yQEm2fi+muo9FRmsn5yZg8X2U/UcJ2cMmM9iPut2iON0IH0XcBs46jgaUGBKg+7sxz
 5fxCEXdrh/cL/61rJv6EhSWjGUczrsponCWALwwkIjwruxtQcL9CyakqSm02z4LsSOtw
 aKtIAV/fmLtilo8yUUqtaVK97fq/oFLFqiLgZfny7Ff2KzFRc7HaW8KlQ5GOtLHA23zw
 E10gjLS+PXYm9LJ9UJa+8LW9fbbsKi8TxVberMS+8X3yb0/KbZL871Q6CjE5WXC9glwa
 j2NvopNJCKOPHWR6urNvRP+v7b5Nw+kZnKy4LL56lRRApPYfBWC+7/a8p/lfxUok0gBU jA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3d6uqgrw28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 04:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD23sABX3yaAOPuDQDtpsDseLKA3UGGdo+mnbcEMNSZhPkImarI0HqhJ2G3dYg4CZ9Kvn+E6ubbsuSVQ22Ypnu4HO2MlMZHSjuRMjFnYJns2DLvB+cfa+GJCmNxpRzw0aWReZmN2WbhP70E3uLtOYQBdpjuFWUdadDziwdofepY4IHbbIn/xPxius2kjMlVraRqnfX4zYokT+hVCkIf/zSaPmrFqekuxS5K3lbKQfZqMz/KueBUq4PhGpFdOJzi0Sjx78uB5GN+AuZG+VJ0spgkcGIVljHu9CdJB15WyTeDs0rkTt9UpJRWMkizy1efL8tqbaca4aMFehP3r53R+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHA2q+xR92R8NC021xbDnoCOYrXGmHu3KgpHgKRu+f8=;
 b=gcGFRfscrJ0fP0mPokiiclO8zZBmziN7wNPQrN5nto9/dj5r9HdLPtRzSA6adi9Al7/dQ8INSaDrhpDghKC0idlA7Su9/FlAzEOrJb4UJlbmiDZS2gAvjzI8zZH+MkJTL/BdjAAvMoEvq0/1EcXseJZJTMHahyQUFGAp8Ff2zj5UzUP/rHvARts46UdRLQNXwfVi25S8+td0OQVueExudrtK1YeTk5ofYeHLJoT0v6D1xUcHYxZqzaKuztlIVRZdq8FKOpwdndAMK44A83UqQR3nZoE/uMsMukyNDpUs6KOHe+PiDcBR+ugfJjDVIRnKsTRH3KizmH67uNweUA7ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB8182.namprd04.prod.outlook.com (2603:10b6:5:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 04:30:14 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::7c94:793b:ee8b:f4f8]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::7c94:793b:ee8b:f4f8%3]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 04:30:13 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Oskar Senft <osk@google.com>
Subject: Re: Slow performance of VUART on AST2500 with 5.15.5
Thread-Topic: Slow performance of VUART on AST2500 with 5.15.5
Thread-Index: AQHX+tpx+y2rftSRxE2MGwgpi5/XoA==
Date: Mon, 27 Dec 2021 04:30:13 +0000
Message-ID: <20211227042940.GA5754@packtop>
References: <CABoTLcTACbnnPZ8dfc_oFwgoT5JikYBHgfTjzknJbqC98rLMQQ@mail.gmail.com>
 <20211216042729.GJ25091@packtop>
 <CABoTLcQapj0LRAAWoo4ncagVGzK9brSz0RJti4H=+eeX5-o5kg@mail.gmail.com>
In-Reply-To: <CABoTLcQapj0LRAAWoo4ncagVGzK9brSz0RJti4H=+eeX5-o5kg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c7c2550-5713-4037-391d-08d9c8f193a0
x-ms-traffictypediagnostic: DM8PR04MB8182:EE_
x-microsoft-antispam-prvs: <DM8PR04MB8182556B74B8A6CD975EACB9C3429@DM8PR04MB8182.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1OU8o9SEo5SG9DZAlGsCNKOY1yFCFckm1F9udQyb68+aZPfsaZB+fV+hSr4IFfeZ99ULvOya6Ca13tybq7xYz5xQb9GLc7nkqCOKG3JOZzlv8c0Efi/OPt+ImMC4xllIH3Dwwt4AMXOl7cDXmhcB7NJ8Vx+Dg+GlnPlY/VxkTm3YHM04UfUrXGg9udV1tT9gDRShyDCsnLCIa+y9tcEE3TPYMP8oX2vP5m/dKGjw6C9WJSdjLw8UUx1mBxDpiupCEtUsebm7IFxAVQfbPQ+g0ax9ezHxGr1YWN4CNaYXNIU2zXjejcR4DrQdUcQmCcWcIJ6hmpWJckg6LxYlWdrdq1wCuKKfSVW9FSpfqymriJQyUqb2UXpm2u+okqCm0pEsHre0iYLOoKumZxwSMU7xwpPXRdA0E7SX5xlx9lqegRzk9qwmOpQPVCDy0fJlqQhUmNltOO/pRaBygUzp+eJg1eI1xgXZfG9QUsluwFekODSQ6cKaYOHR1g3PJPiILIB+Rpn96LPQAggXfUTO0fY6CaOd9/sZVp3xiN+/FA8fe9p7dD9WPccZgKzg0oTXVSajgJhIptP8rAka6PjSp8PiYITbKBtsfu7AGXBDQDDH+7IWlJA+gNpDIo7XDteTYWhfyWtcsZ5eX9N+6xJKy0zvUdE73pQYP9uQ+lDWOE6y9IPhpviW4SySAoko/wyyp106
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(33716001)(83380400001)(508600001)(8676002)(71200400001)(6506007)(33656002)(5660300002)(6916009)(86362001)(38100700002)(122000001)(64756008)(8936002)(66556008)(316002)(66476007)(66946007)(38070700005)(54906003)(6512007)(6486002)(1076003)(9686003)(4326008)(26005)(186003)(2906002)(66446008)(76116006)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rYtwLHJ7Ysz6ZIZtL04EcISFapvCpndWyKafxrXCDxISFq4gujJDatPIzAUX?=
 =?us-ascii?Q?3kce/Gfl+efDHwngvgsVgIj9wnSmcMuLvxbqlK+uPG+uaBtMJWqRrnxgjsux?=
 =?us-ascii?Q?bwyhb7VuAcfv0VHQ/LIUUE1kE/Sj8aoYix1jBASWYwoMfpVh+OqOTrm8U3wB?=
 =?us-ascii?Q?tkbKuFX29iCsB15qFt0/hNswEaU9C7al8n9EDHbZ6YDbS5TabnJiVSGAAEuJ?=
 =?us-ascii?Q?zO72X+m+X77AxcikAolXsNpz1jDZIywpHjJzetfXCLRA3EGimvrD4Ftbdytf?=
 =?us-ascii?Q?dYIdWuJ3gYOLverEFXTQzg+7zi0J8aBAgpiwllAIDA+Bgf4Q5i7wMhKHNd6+?=
 =?us-ascii?Q?vCbtZWpg3XqlpeoqxPlRtAGcwgCnC2AblB1uzH5a1JM7q9R0t3/76q1vTJN1?=
 =?us-ascii?Q?oCti5aV70RnSVCnVsPmiWJcOYU32wlbfXZL/cnS+iyxVpTbAlNiPxDi4HqHf?=
 =?us-ascii?Q?ZXKMfpHia3RjVnJUYd8GvWnDJ9daZd128aIpjhXZQ9EuuO1XyT/dUdo6npKo?=
 =?us-ascii?Q?7p4KHWBct94bA/qIRBq4l5kGsOn81rm8fLqL3/c1hHJCzAtbyPrhYE5R8Bcr?=
 =?us-ascii?Q?MAYeehOkVRd5aiVZShA43f0pKm5rqTR4pgCEuG+lvJKGH7QJ0kirO8LBRLXG?=
 =?us-ascii?Q?IKmIZtPEKKZt+QYsFcdshawzhskBY3aqld/ZPLEuew2bwNRrsU+Kn0e8ARUj?=
 =?us-ascii?Q?qasc7HrU68Xti6UwJXCAV4AeFvPRX0WmpYIEYoxaqGXK3AQgqlbNIR5LwJg1?=
 =?us-ascii?Q?0kWrKPg+0+sFmPIvxFotkWDTdTkUhIf/LqqTGT9cLRG4jPTx02a9ho6QOluT?=
 =?us-ascii?Q?ylL9Q7f/JvmdHvdJGSub9ffUPuAbQpkbdRPn727syZt7d+ISbAt5rxQ+e+fn?=
 =?us-ascii?Q?myY2N8T8mpmccEKiKK0dTq0XxLX8O+JXJcFv7k9IX0QWDMjY8W/TQ7CR0MXg?=
 =?us-ascii?Q?jAO1ep0+JuMEOPhCx/kETcJn/iNdRZ4vhpSZzAb2tdroehzxLW2uH8GTPmpg?=
 =?us-ascii?Q?3si+GQ+e/FA5HeRWOiLqpDl1QOtWCLUvWBhAgW2ePQSzTOm56Zqf329u5EtV?=
 =?us-ascii?Q?qsW2jUoPE6Q+vcgYpJHE2KWTPVLJWDgUhkr5bwQTmPKUNaUB5fcrAUtX9JDY?=
 =?us-ascii?Q?1itQsdW3kBAVCvSP2c6rpq+JBEIY7rU39fARSPYrAgR9KyzNdSxQU42zVFRE?=
 =?us-ascii?Q?nfb3e6C6c57QA9cVG0a/phsl04iAo4NNG+JqaVj5bYGxo3HIeihR6Sup9Es4?=
 =?us-ascii?Q?ws4ZYh4i0MV9OtsTrc4W+5Y5/yxl6volo7X/MBAHaBD2ro9iMoKuOLWm2mKJ?=
 =?us-ascii?Q?hqVGW4IgGAoOTiFWI/EXoj4KG+j4jY6jiHnHI5pgPEoxZe56IxpsGfNBVgBN?=
 =?us-ascii?Q?8HtQYwVMLmq3czXtA0quqkMRxGK+X+SMDY8sGmXHsV/2/1VXxl5VB0UN0Que?=
 =?us-ascii?Q?WNOgg0FFcJSsjjEFcH17TNKXwpsBFWAhNgzT6fOO9X/Wtur1HqkfdBgzTahk?=
 =?us-ascii?Q?mtEt4DbRD1iBEG3QjHcmGio2y4OSF4l3DoE+I5rJDJs/a6LNiVd10BJAEixD?=
 =?us-ascii?Q?SG+DMjFmoUrlZy7uwUWgZbk/3X6ZqhJhV18HLDiZOcXn8S40Y9MsEdbcRNGr?=
 =?us-ascii?Q?uRPHMaN+YtnXPBwu41TQF7k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AEDBE2147AAABD4AB811A1C92EF256A0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7c2550-5713-4037-391d-08d9c8f193a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2021 04:30:13.7499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtvGtQOXrEDcozPG6Xiv14MaS12iXR1W8JucS2fKvSl98qlg6snoB+AY6KV2XTzyPZSCLEdPfCsaNvdo40Fm5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8182
X-Proofpoint-GUID: 45taWfB8QogwVL-RylTkdkxdcKRurA3x
X-Proofpoint-ORIG-GUID: 45taWfB8QogwVL-RylTkdkxdcKRurA3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_01,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270023
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 10:54:19PM CST, Oskar Senft wrote:
>Hi Zev
>
>> >Is anyone aware of AST2500 VUART (or something else that would affect
>> >performance on an AST2500) having gotten broken somewhere between
>> >5.2.11 and 5.15.5?
>>
>> Yes, this is a known issue.
>
>And I felt that I was going crazy! Thanks for confirming that this is
>a known issue.
>
>> Prior to commit 54da3e381c2 ("serial: 8250_aspeed_vuart: use UPF_IOREMAP
>> to set up register mapping"), a long-standing bug in the aspeed-vuart
>> driver had a side-effect of unintentionally leaving the VUART's FIFOs
>> disabled.  With that patch applied to fix the bug, the FIFOs get enabled
>> as they were originally intended to be, but that in turn seems to expose
>> another bug with the host-side THRE bit not getting set when it should,
>> so the host-side driver's write routine ends up waiting for a timeout to
>> expire on every character (when it would otherwise continue on to the
>> next character upon seeing THRE asserted).  I think this may be a VUART
>> hardware problem, though that hasn't been officially confirmed thus far.
>
>Did you reach out to Aspeed yet? I've had some good experiences when
>talking with them directly.
>

I've discussed it a little with Troy on Discord, though I haven't yet
heard any conclusive statements about the recommended course of action.

>
>> I'm hoping we can land on a better solution, but as a temporary
>> band-aid, hacking the driver to treat the device as an 8250 instead of a
>> 16550A (effectively just re-disabling the FIFOs) should speed things
>> back up:
>
>I can confirm that this fixes things, thank you! Is it worth dropping
>that into upstream for the time being, or do you think a "better
>solution" is imminent?
>

I don't really know what the timeline on a better workaround might be
(or even if one is likely to exist); hopefully someone from Aspeed might
be more likely to have some insight on that...

I wouldn't be opposed to dropping that hack into the mainline driver at
least for the time being though; seems like it shouldn't leave things
any worse off than they were before the accidental bugfix side-effect of
the UPF_IOREMAP patch, anyway.  Joel or Andrew, any particular opinions
here?=20


Zev
