Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF246E42B
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 09:27:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nFq0R6Lz3c7V
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 19:27:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=L70xmdXo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=39770cd962=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=L70xmdXo; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nFM0BPKz3036
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 19:26:40 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B983QBa008153;
 Thu, 9 Dec 2021 08:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=lf1PydKwrCQ84/tL2JP9+Rbt4qM3KNoM1xj7krOWvFU=;
 b=L70xmdXopSDPIi49qAVpmSFp6R82TsjIXbk1k8Af0Izq9a94hbqb1QtbzjMKdpLovHSg
 jcYVyv7oTBTTL0TsPqALvKcpwp8CJHz+Z7X6uRKQQLVGid6qGjNyQFJsJnu6ckCwSJZf
 iTS5wE0CjO15Erf9D0uM0vhkbgEn2Tgn50PIy+TlUT+lsxMZzib6L+IoTz/JWHagzYQJ
 aZzqeSF2eh9mBTToaUHtLiwkjfQ3tEj807PY9iBxT1EOEG/jO8cMnQR6mOUZT0/Upucv
 IeLg//40ZBsyyfGiwg0wZ49RC3XIWoKPEK/zKJYJS24OWoJNYjDIlH72nEMmKa+NGTW/ 9w== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3ctyfbty00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 08:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOqtxn2Gb/W7wGdGnUQVOUtXpSBDzpBHqg+dwJ63ERyJBhqpwiVIWAjLHR3lOPrgfpLtcOjUzaRTuLSUetW708RuXZiTcqioZNo/QcSjmy3dBB6D4wMCfPCTgtHF2RUdBI1p/sjqD/FxzPL6u8BqOsK/tl8sXAptQi35CGPjo6tutvJ98PyxJuqEe1qQpFw5WnQIi/fsDnA2bWMuYWJDNUtKFlZQuskE0jITbbEuy1KR4+wSGpMQGzU7EODE5JXAN0ioQZNe+FktL3PxctfWIvniGdGBGWF7THxPWbsmJv29TUg2Skr2O/IIPRdi3fQzV+JhZnMeI759i4sTgSmdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf1PydKwrCQ84/tL2JP9+Rbt4qM3KNoM1xj7krOWvFU=;
 b=BJ7OMSXqmwO/seQV5t6rCaPDNtdwYcWn1iCrMLUyQlDQYGVJSP+QT0YAfbR1ypQYnvOp4nT71zj+S2x3cFo6HbG9KyOCuSCsTmBMRsI5KoGv1qX/wdDGtxW+35PfhxYqP1GEejV1TdB+I3DJPWJI6zxZr0giEywQeAgw5gFuYQehsejjj8qBZlbusi1Ds9/bcoQYjmhOJjlbcC47ys689wJhPBfi7RRGlsDb2gQnef4QpUdG2zPdd5auyHMG+v3nhhWKj4LbxqFmD8S/b9zq6xi+u2xBfVGWOT6SWDeMBB284dHG1uDFO6z60sQrMQqi/X4zfw+9+vq+rxMUPIMlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7944.namprd04.prod.outlook.com (2603:10b6:8:6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20; Thu, 9 Dec 2021 08:26:24 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::61fc:37a:892f:c6b9%8]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 08:26:24 +0000
From: Zev Weiss <zweiss@equinix.com>
To: =?iso-8859-1?Q?Jonathan_Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Thread-Topic: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Thread-Index: AQHX7NZz4X2KiWn6NUSUMKT7zlTdMg==
Date: Thu, 9 Dec 2021 08:26:24 +0000
Message-ID: <20211209082623.GF25091@packtop>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
 <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
 <YbC6Bv2teZ5CFhFQ@latitude>
In-Reply-To: <YbC6Bv2teZ5CFhFQ@latitude>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e1e5df5-9eaf-4fea-8b43-08d9baed9660
x-ms-traffictypediagnostic: DM8PR04MB7944:EE_
x-microsoft-antispam-prvs: <DM8PR04MB7944EE49A34BD388A5B7B1D5C3709@DM8PR04MB7944.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OUupv1fjkM3/tat2YSUeGBgOQnPZeF0BOviiBDvHHsgsjBXhp9dysjtMG38gYNQv5xUfLa5I1DE6asnLSKV0mEBofZynMudBFbu/Ay+soeLNHGtd1AUNE/G9TAb9xDUxP1w7KZSnbtKPJ0GsuaYFfK7BxBd5VtntrP5oBvPNKGXjVQ6K1jqL2aq79tpVSCaKO1x/UwsQ8S0jnQqYApo2irZ1RGX4wWj+HLRjEA605DXO64Jdc/jcihU4ZhXX3bylg62SBrfnLnu4aqUlBlus26BCBSGGJtPTjy2brPac+tBkLVoaGeaSCUorFt7Cnat/90MYFEc01oLkuq+Qx2XbSbo5/Uwuxh6YOP3iixh1CvdM3NuxbLaWep+eXzv/pOvPZ/bd5loiyTEON84QECoqNpM3K4uCLdtFHkgb78Pn0LgepsBFopLUINJygs9QpI5tWx+8UDhcvibNKN8ao+VfAr7ooKxBgwC5SqFYhwsxJbUJVBwXD/FEQOjK8Btw9v87c3nfUC8C8lENxd94u9u0VWd3Fnn9rrcT+cCRjL0qmUl/DArI3x7dxd4884eYbI2V5ByQO7xHEpTZEqK34tEtN9bqlMKJKNEwK285kdCggWWtUN8xqjjgnLYlnVitAakUrtwAB8/XtzWPY3+1LlVXkaYv4MKtn0LFSoXYOiqfphHT5UrfXFVdkBWGa2cOH1bLyulAw5ArWeLn1iLLBNdt6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(38070700005)(122000001)(8936002)(5660300002)(8676002)(186003)(86362001)(316002)(38100700002)(6506007)(66556008)(66446008)(33716001)(71200400001)(66946007)(64756008)(26005)(66476007)(6512007)(66574015)(54906003)(6486002)(508600001)(91956017)(9686003)(76116006)(33656002)(1076003)(6916009)(2906002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?csTLhhqKPdJ6OPUhgbwD78Daf0LcNYnv5M1pGfXD4RVeIWKTnfu7o2nrxq?=
 =?iso-8859-1?Q?R4OlNNz4y+cwb0GQEOPXbP0m8wau8QHwo27BOXkWnikpn06c4788gC2kk7?=
 =?iso-8859-1?Q?AZcDi0Gi9Z5U6lEdDIHo00aYCa8FpCQ0Sjv74u9uypUKEdDYpUGbpnBqxS?=
 =?iso-8859-1?Q?ohjlZzXeITdIQltrTnIRU3Pthaq6SxYw3ChQEkyxkXVz+7FgXaXj+5zBSV?=
 =?iso-8859-1?Q?P1dTSSIXha/rJZ1vBb1W2tfb9pZNVkHn2PMZR0kLIddqEAkR5p1AMvY9dR?=
 =?iso-8859-1?Q?SY+9wROmK37Q95h3VZe68PJx7r8ADPDEGR42OUwQPP4Xc57Slh8+qS/R9I?=
 =?iso-8859-1?Q?Mg+K26StqTC/W5e0CdgjETda9mDl+Ymfxh77yq+nrzRt/rCNtZGsDNWqiH?=
 =?iso-8859-1?Q?8Ny+RoIeiGpAm9JbZndU/OrOOcBNZSaxmIQlolxGRH+djuh2JavpsZxmkM?=
 =?iso-8859-1?Q?RFUvNsQKtDwcuGSrb1jVYd9Y9fNhq4b4fJji52zCHi/JO5VQCYprqNuIT3?=
 =?iso-8859-1?Q?+TyWw8+FKGYZYQyaFVRxkJdEp2oJw0l0CttHMnh02PCO1ZXz/glx4/r66b?=
 =?iso-8859-1?Q?kSWlEibUkZJr1TzQuSCn8RXXHBTwDpetFJ2fYeLY6FGJri1ejiTzC4Sk7C?=
 =?iso-8859-1?Q?fiJasL2LOPh4b5TSosXmDQ1rlMwC/3BlXCrr7xHGN7TI73YGnqBz9qcEG6?=
 =?iso-8859-1?Q?cbhYVZEtaQZ/5ORdxWk7Ok+WL4h7Y9JfysfbC9WK2yGT0/FGuWrbvI0cWX?=
 =?iso-8859-1?Q?+8ezkMO6pd87qgnD2MFuz2WcTAuRR6mt1an+PprzDa10i1ixF4zR/juDMe?=
 =?iso-8859-1?Q?3kt41j3O6zSlbzSzfhx3W3Qhu/mJfXR6zSYG+qQbRqDB5fKquJswJDZF8y?=
 =?iso-8859-1?Q?E0Kp0VsyihHo4EW2cAOEMB2OV8gTxdOXziScrryOV4bCXCfLq6wjkO5/HX?=
 =?iso-8859-1?Q?8F6o9+0sxSfGu3TYrMQDoChLE1+74Qznet88OAf7JLmOJ77m62+7tUoKrf?=
 =?iso-8859-1?Q?+bfNaDadNwpQSZqvGvhloJmD1jkzRW/eU7yh3rvViyvp6YGM4CUGC7nwSm?=
 =?iso-8859-1?Q?jfuwOq28+V08ckd99D5qid6ouKAkJOP4nehhqb8tUDYM7kOSgsQsl6WHPG?=
 =?iso-8859-1?Q?jzYwCQlLyl13TAWZbpVjksXcM/oR/1PzEC9i6043DKbunVslv3YTFCAqNq?=
 =?iso-8859-1?Q?8c+7PP/vJqt1Q5FTy3g6QdEFx8EgOM1u1KhxZrvLa3lzwuv1TEg55cgFcs?=
 =?iso-8859-1?Q?nOkwaSYy2l816IB7kZIBX/b8RKIENscn23OtzKkTFyOaDTR4WwcI1yE2PT?=
 =?iso-8859-1?Q?pODXnCvQjsqIN/V7i36JvYAJ2XoNm2NGd9zaz8YvGTulJIi4oJl1UQjKvE?=
 =?iso-8859-1?Q?ZwbOH7cDFXa95njFBZjYrebRxdjyVyjBQVtGn34NXO5n65sHmc6zFNqUCR?=
 =?iso-8859-1?Q?sa2E9tHv2T7TZT6S2X91+YflNrEp08ALgOQUiUpZx0r1gdOeKoQVvX264A?=
 =?iso-8859-1?Q?CszC7kG0ko5sPGMmYT5g3pVXE9dEYQc3vctGLRmmzRWExOav5ujzt6FAbW?=
 =?iso-8859-1?Q?vSg8U9cr7L0lLn1kWzlANEAidha0Eg0x6C+GrPuGUlEnaPh2TQThAc5Lzw?=
 =?iso-8859-1?Q?tDcA2rkxmigLnqX+xqaDG8A5gNUOocD7LAacRBajZBrn8mFKqw9jpNs5oj?=
 =?iso-8859-1?Q?9q7AOADJOBKHkvgJj9c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5E60DF1721D9D245A7F75B8F76B0AAE8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1e5df5-9eaf-4fea-8b43-08d9baed9660
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 08:26:24.0918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVg0eiAqopFJNIJzbLs34QuOyg/EcF00Z/Xo1IgBC4a3hEUD6asL72ybANw9BbuSKiPfKx5SRt2bGQ2jrISkmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7944
X-Proofpoint-GUID: GSu-yJY626MFc2Vj6OqkrD57I2stm8zy
X-Proofpoint-ORIG-GUID: GSu-yJY626MFc2Vj6OqkrD57I2stm8zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_03,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090044
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 08, 2021 at 05:58:30AM PST, Jonathan Neusch=E4fer wrote:
>Hi,
>
>On Wed, Dec 08, 2021 at 01:24:18PM +0200, Andy Shevchenko wrote:
>> On Tuesday, December 7, 2021, Jonathan Neusch=E4fer <j.neuschaefer@gmx.n=
et>
>
><snip>
>
>> > +static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
>> > +{
>> > +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_desc_
>> > get_handler_data(desc));
>> > +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
>> > +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> > +       unsigned long pending;
>> > +       unsigned long flags;
>> > +       unsigned long ours;
>> > +       unsigned int bit;
>> > +
>> > +       ours =3D ((1UL << gpio->num_irqs) - 1) << gpio->first_irq_bit;
>>
>>
>> BIT()
>
>I'll use it, but in this case, I think it doesn't simplify much the
>whole expression all that much. Is there perhaps a macro that
>constructs a continuous bitmask of N bits, perhaps additionally
>left-shifted by M bits?
>
>Maybe somewhere in the bitmap_* API...
>

There's GENMASK(), though it takes a high bit and low bit rather than a
bit position and count, so it'd require a small bit of arithmetic, e.g.

  lastbit =3D gpio->first_irq_bit + gpio->num_irqs - 1;
  ours =3D GENMASK(lastbit, gpio->first_irq_bit);

or a manual shift:

  ours =3D GENMASK(gpio->num_irqs - 1, 0) << gpio->first_irq_bit;

(I don't have any terribly strong opinions on which of these is best,
personally.)



Zev
