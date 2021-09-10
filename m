Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4499F407329
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 00:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5qYl19DYz2ybK
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 08:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=dQfj9Nmh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=088761d2b9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=dQfj9Nmh; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5qYF55P8z2yX8
 for <openbmc@lists.ozlabs.org>; Sat, 11 Sep 2021 08:00:00 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ALDUJa031229; 
 Fri, 10 Sep 2021 21:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=0OwI/4+ddbQ+J43iTtcvOkaIddlk5u1Q/X015097uB8=;
 b=dQfj9NmhZzmnuDI5zVyAUnQpLXk/XnCSe4jnZAb2YhVDQ51IbLnbFf2o3g61VznRiMgv
 tkyZUhfUuofNx2yXOY836Kvs8/m+cXIevyUeNb1Ps62b+AVztQPt/2kxV7WOs4mNtdqF
 xoRUpVRV7KlWJjTXFvaURJ/ZCrzvEtxj5U0UB22BsuXwCCAf9t9EnWSc76nC5NtFY4ed
 6eA5nMrHw8L2CXEMS8md3kzfGI5BbTAY1j33+L2FLXGO2iqMGpe3jGw+SFdoNDQJFhJ9
 VjeUE5bKJ5VJLSwSwIssM/kty2lDnAhmvgJ1W19+7GuuRxGU/GcYV0PiaSDX5K4L4V0p 5g== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-00268f01.pphosted.com with ESMTP id 3b0bjc0qtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 21:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyHxDF06jK1fv1SPL9KRYDFJVnjnC9Ct9/YRVfEuy6Byq6Oh3PSbtUP+7WbBJddzf/r9qPsD3T8qEdRYXx4/pq2DVLpps4wNBRYTbTE5aQbJgcFsYyyn5Rfk0c/l0K+Q36rWd1klTcozZDaeXO+TW2XdhvY2TTPJXN/BFHY4KC3fDRWqABbCGxSMTFtsulaVY9iXo4qCvnuYRELQxCjDCdP6YYtXmPduBm9JI3vv8GQIwPhD8Tsx0Mps8CH2oNeGGwffJpxuNTL9ZVOschHPLzJBrFLfsz14eUb2R6okRPyNE1FUKxz2hwTCjx/xKS23orYDSyckatKZtAW2+dp06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=0OwI/4+ddbQ+J43iTtcvOkaIddlk5u1Q/X015097uB8=;
 b=UkaAy59EplnMX6Zy6ZQknK0D3u1xKJedJw2Dk1bZvnvPfa00nRfz7LbpZbR4SH7QWtgz/QlUnPqgL3RJpzGoOuoHkZ0ljBUgrLwks/UBYuRiEVsDreTxDgezsrkH251nQwzOZR0c/TIlhTqSDZcISkEpCVPMVm0hQ2vu6HtAH7FVUVlafNlmCrRztj34/anh/dB33AWQo4hzGShfdyIgqxV0ZLdHCTlNXoq+lO+yYZR1hl/1FJm6o84Tf5X9yDoIdGpQ+80XFp10auAJbxGvgQYbu1j4AcoAsEnyDnL0zhDbOPGFXbWNqKdKvQH+Zcsbj4Q95G6mktkgzKjBmmPOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7992.namprd04.prod.outlook.com (2603:10b6:8:7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 21:59:47 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 21:59:46 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXpo8qZtITUnASC0CJomxE9mdraw==
Date: Fri, 10 Sep 2021 21:59:46 +0000
Message-ID: <20210910215945.GI17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
 <20210910052835.GF17315@packtop>
 <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
 <20210910083542.GH17315@packtop>
 <a2c3598e977a6283a9e65f3f29a74fe55d12ca20.camel@codeconstruct.com.au>
In-Reply-To: <a2c3598e977a6283a9e65f3f29a74fe55d12ca20.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0a8393d-bb75-4456-1dff-08d974a64d7e
x-ms-traffictypediagnostic: DM8PR04MB7992:
x-microsoft-antispam-prvs: <DM8PR04MB7992C344E0F9500D3510EA8AC3D69@DM8PR04MB7992.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4WiUFRB0yTJjNLAhu9+2IzH6MtDxtmNUjXhW4vo6biAz3ChpYlQXNrhnfOaMiK9fojL6HPffoSVvym88ZdM8oYHQnM+N8N4m0QEOx4nVJtg4C0tfv9NROPY7llUugprhNtKFqWS7iiZMQPyDKXdjHU4HrSMaofWhwwv7zqT4DoGb/W54iRyZ7Re6ZgZfkA9VfNYj4STIGr4MQqQFukPbTYhZ3bmEYjp0T5RBGG55BYR4xpetKozWeEkybqe6mFLyQnlTiYQ7Iv3xYWi1lyPyPFF3IQ45MJElp8TRXthg/974Zqej7BFJ8eCZk6o6brJiDeu83W74AL+wncR+lcXCU7+4wuYN8BXtPWsmTpwQm4dGjCgBN3jTyLKJdg2x4sZQPmGfhYESdrfUyUqvEehS1uXsvR/mwFU7MI88Hckm1GpNrIo4UDCCAQ9TbdIGfOFo9QNEcraz2vwu0UspT582yxzDCV+gjKjIhrjfPu/XvUUmraCUehL3feudghHz4RP6f1IdEvJIDAMiu1ZR/tzhDlr1ccki0hZ0yJ4tMawwoGgpB8YiAVqbjLFsUFQFx35QNWz+c/3Lj6uNcL6Cjougzd0OLsBD/bRCa858N2Llivc+b0dKvhqb9zd4efvenqCPIGigIExu2NQHVpsQeCV+xjZOUm3G0L8LSqdDjls79p2/K00GRD9hOiC4dAK3u0xLgDb51zSatt66PYneJLR2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(316002)(86362001)(6486002)(6916009)(54906003)(38100700002)(83380400001)(38070700005)(6512007)(9686003)(478600001)(91956017)(122000001)(33716001)(4326008)(2906002)(8936002)(6506007)(76116006)(66946007)(64756008)(66446008)(71200400001)(186003)(8676002)(1076003)(66476007)(66556008)(5660300002)(33656002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NoFZMfIFi2QuYztHrPoe1PO3hZDI4KMJ5RK8px/BfYK9qBp3iriz2A8qEU?=
 =?iso-8859-1?Q?popqOHBUS1Yz17wco1qIh9IvloOw4XH79RaqiP0wqtSRGv9aq+1FQkHCds?=
 =?iso-8859-1?Q?eWTyuU+j/Uq4cXm9NlzzEF1WOdATXnJeHv9dMRHZlyZicVEAA+xZLPXNeN?=
 =?iso-8859-1?Q?uCezH3XZtrDaXlO6idReZF1j4m7Ss+VFl8+4jSb3hQUWr2rZ4iNE3fCWoH?=
 =?iso-8859-1?Q?is7aeuWwU9gP60t1tC+IPnUnJtJOYBku+vIUvZ754/j3+TM/hcOgfa2X6G?=
 =?iso-8859-1?Q?hAjiFS55QQVndq1ux2CHMRhfipiGRG+3Eg0qnYKIzF8eZ/k24CRSO58LYp?=
 =?iso-8859-1?Q?kaO6GiVaIVg5loXTa7IrEjXgqfIXaNx1r5QZ99zmh7u374cRwM4MCXG1Tg?=
 =?iso-8859-1?Q?rmihnDkk3EXAlVcVH8NrcHk+vUfd8PTv4VP5JvrP870DP5PY5GtCKLGw9u?=
 =?iso-8859-1?Q?DSu4IyxgisMT5p+Ja+fhec1hdHhs1inVlKOAerNIVzUAFWGi9hyh6JI/R/?=
 =?iso-8859-1?Q?GGl5F88W+GaxidxPlkCtuNlc9hPcwtLRldFLDAP92Ikoi9QEdARdmntA0s?=
 =?iso-8859-1?Q?W+QPpk81oerFdVOTNGksNqINTD+M/suwxsIvRe8NXK78U8eUt+HQ1lre2z?=
 =?iso-8859-1?Q?YJcr7gPRxs98Pdd+cw8bOOGJAJhvo917PbE+gYAiwanAQjhtknJmhl6Zb/?=
 =?iso-8859-1?Q?VzkJIE5xdvh8mP0YUoJ9MJV6w3F/HSLxCr3IaiLNn7T0DpUOp1J+O4BWNT?=
 =?iso-8859-1?Q?qMTsxuxO7+nAHAGsY3uDdha1bOKj1XBlKfbzWWQ8hHEbbuJlaSDHJ6Ohe4?=
 =?iso-8859-1?Q?sT9B8nKU2YLjbHyfvhfvTLhUrrVve44Puw39VAp5TL0399pMmU4CzZwdGf?=
 =?iso-8859-1?Q?TSp3sLbClS2El67Ny0p70zdkS03ijJEY/0fVWqap0/1uOxyJb9fszCn5YU?=
 =?iso-8859-1?Q?KjVRgwwrPYTYgRHqBW60ZnnFwWNTOSa5mkjgvTmf5DF+dUpOmVyEC7n9xu?=
 =?iso-8859-1?Q?d38FxLk69wUOdA6XVSxa8i4ilNaVrS3p+qrrp9QRrwv1OSAx0mru70hr1K?=
 =?iso-8859-1?Q?fqhEcvi6I1GkK1W5kcws4MosQrhZ2D4/0mSR3+HFyzKaeeDKA8CijuuD+d?=
 =?iso-8859-1?Q?GUuqIMxX3i6vQm/tDvg9g/kmmzIxuw4kgKsLERc8Cj23Q7/FTT97DboiUB?=
 =?iso-8859-1?Q?KThNqjaxUfgZtZFxqP6KhG8iBmcXWKf6GqWQ64uxxUCdRUkOD/DGOVlVF7?=
 =?iso-8859-1?Q?ScxWOfJmpTY3YqGL/9sWOzqAmTV50vjjJVRAweWblFfMQiTDYS/DT3ZQrS?=
 =?iso-8859-1?Q?ROmpbqlbxC477Jlo+/o8Zc6WTmnkyPhjt9BC/Dtg9oJ5dQFYJfAvQwIUuU?=
 =?iso-8859-1?Q?afuSyOyHC+J/vWPLTO87bMR1AyN7bpxg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <89D13B994F6A6844999FA8CE2C204A4F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a8393d-bb75-4456-1dff-08d974a64d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 21:59:46.1815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VB5J2lO7xiRR0RplthLFyrqPEWJXYP0vtKZNb91ysGVS01HpUt17HeVzYDkr5pK1zrkpjbiCDUDy06aTDN01KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7992
X-Proofpoint-GUID: 4qNsNDOKCXPLuT2z3R8JSqwvGYAM8kwK
X-Proofpoint-ORIG-GUID: 4qNsNDOKCXPLuT2z3R8JSqwvGYAM8kwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_08,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100120
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 10, 2021 at 02:08:40AM PDT, Jeremy Kerr wrote:
>Hi Zev,
>
>> Sorry, which semantics exactly do you mean we might not want to
>> change? It sounded like Oliver thought that interpretation of
>> "reserved" should be viable, modulo some possible bus-specific
>> caveats...
>
>At the moment (as you've noticed), status =3D "reserved" does not
>instantiate the device. For what you're proposing here, we'd need to
>change that: "reserved" would instantiate the device, but suppress the
>probe. I'm not sure what might break if were were to make that change.
>

Any particular possible breakage outside of the possibility of busses
that might poke things independently of driver attachment as Oliver
noted?  That aside, if nothing's actually touching the hardware I'd
think the only real difference would be consuming a small amount of
additional memory.

>> Well, I'm aiming to be able to use a dts fragment looking something
>> like (on an ast2500):
>>
>> =A0 &spi1 {
>> =A0=A0=A0=A0=A0=A0=A0=A0status =3D "reserved";
>> =A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
>> =A0=A0=A0=A0=A0=A0=A0=A0pinctrl-0 =3D <&pinctrl_spi1_default>;
>> =A0=A0=A0=A0=A0=A0=A0=A0flash@0 {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0label =3D "bios";
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0m25p,fast-read;
>> =A0=A0=A0=A0=A0=A0=A0=A0};
>> =A0 };
>
>[do you want just the flash node to be reserved, or the entire
>controller? I assume the controller is always available...]
>

The flash node would make more sense, but thus far with my noautobind
argument I've been doing it at the spi1 controller level because I don't
know of a way to do the runtime attach/detach of individual flash
devices behind the controller (the analog of doing the driver bind via
sysfs), and from a glance at the aspeed-smc driver it doesn't look like
there is one (the aspeed_smc_setup_flash() call in the controller's
probe path seems to be the only path to instantiating any child
devices).

>> ...but I'm wondering about your mention of "rather than instantiating
>> entirely from userspace" -- is there some mechanism for
>> runtime-materializing a device ex nihilo that I've remained
>> (embarrassingly) unaware of?
>
>It depends on the bus; we can instantiate (and bind) i2c devices with
>something like:
>
> # echo tmp75 0x50 > /sys/bus/i2c/devices/i2c-7/new_device
>         ^    ^
>	 |    i2c addr
>	 |
>	 i2c device id
>
>- which requires no DT node at all.
>
>But on a quick check, it looks like there's no equivalent facility for
>SPI (which makes sense, as there's likely to be additional platform data
>required for most devices..)
>

Ah, right -- I've poked at that particular one for various i2c devices
before, but yeah, it's not quite so easy in the SPI case unfortunately.


Zev
