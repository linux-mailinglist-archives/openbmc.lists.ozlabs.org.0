Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C104066BB
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 07:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5PZ55SKfz2yZp
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 15:29:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=HmdUv1ow;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=088761d2b9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=HmdUv1ow; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5PYY4mDgz2yMP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 15:28:48 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189MRvdv024494; 
 Fri, 10 Sep 2021 05:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=2CSZtdhb6W9otXdJZb1jlnghrpiCq8+uTfAOcFZECMk=;
 b=HmdUv1ow6F0zBh58xtCdd805AYOIAWMCyzertplVWkxSwSKNJ1tpJRCt35+V7ZdwK2lc
 20B0wEOu8gpNEUXrCeSwW5Hh7w4mHgrh0Aa7Be+asMKZ/SAHdoe0sLLKahPgDYE5namV
 GALANw+X3r0+aAU0WKaJ6T3QO9J0wKBaq5L2SK/4JSDGXfO1jjv787xuBEB7V4RPa1MM
 1nmk0XkzqczyaimCxVc8JC8jX+NtIZfqNYQAoeJVhi3uAIPsh9YAQWInqkZaam6bpqN4
 KlkkLCYclKep7c5XGNqQ0VLUAtcYHaeEO62jit5s9FjrinHcBuELY3AZmHNqY3yehJ5a vA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0a-00268f01.pphosted.com with ESMTP id 3ayttg15ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 05:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBdk5ViOIEGC9fcOjtKwIOdYJ/pbcghPtwyTUwtQt2lpi2UVELvVjPPS0TJ5D27xm9nMpcjBFmJqhpfkVWt83WxFj+OjMRVaTHxGk1sBYj7wP75fFmC1Xr2S/+3rCgg7TxmvhSNFuI705sD/Q9+xBbpiY+GZ5t0Y6cbQVuPoKtwbUKRYNAsUBJTUL7fXSW3mTFUwQ2Uls89XkVw25FvyfYf2sOID0O77AlZE9DnCZPTgBb9HUIFO4vbYuUhtAeQIFutSdnmcXoInuSrybqr9ih0fbbogDSxyEm/6vfHGpet+cyp03dk07kpo/aHb6u5nEoyBd4LpZCrd5dm0LxeAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2CSZtdhb6W9otXdJZb1jlnghrpiCq8+uTfAOcFZECMk=;
 b=JQGhFCxXQFewL50ov3zrwqkiUtEUnUdFhD0MuGzAsea+hwAjvStprUM6iA8T4uaWJfY2PuNwGoZiGJXxJ5bhXJ4S1axiVI3ZVwhGuoYBlDxuXQLJAPvAtFCiNyvd6U10+YZtEtKBvoMmNttVkii+PejVrgIgJ3sXj+T2nFoLCKYP//OeGKyA4WMk/CGvY0qgS+w7ucXtkCwz1Rigtiu2rfsJtsYzN9GNqNxADOndHu/77xCScYj9N4pX8i80LQHtfVpsY1xjJ9ltSQyHNQR9guY3pSyAga2lWDYzcYV+gQ2nplzUXIUmhpMpM5YLefu+sut/bdxy8hPOj3LDw9wyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7911.namprd04.prod.outlook.com (2603:10b6:8:3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 05:28:36 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 05:28:36 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXpgS0Kivv7WUDKkW7H0LNws0OHA==
Date: Fri, 10 Sep 2021 05:28:36 +0000
Message-ID: <20210910052835.GF17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
In-Reply-To: <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1d743e7-3693-4a33-5ae2-08d9741bd6ce
x-ms-traffictypediagnostic: DM8PR04MB7911:
x-microsoft-antispam-prvs: <DM8PR04MB79116CA08EF115033327EC47C3D69@DM8PR04MB7911.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XaayHLEwWEkQDL4RHk5WnuF1XHxr1nsT6q2jGuyJoydhZXkIIUn60cc2CdeRz8TXyj2QTO+JEHPRWkzaM3QadfUQrPbw5M2SUEFU7c5HTDy9Hw8PkkqLqAA+aHJEi1eI6yPEbsp50olpCZeCsi/D9i2FwRONKFeYVO+Ob2VfrkcaifCNFohqvOjIukZaoFVOhMAtnA/9naphgxrGHKI0V0jcGkA5ZwwfPYOBb5A+YY+tgwYjQFrSy5cZ7EaCZja4fgmgHcMai0+N8qzS+sOX7uqtXLttYUul8euFRRq92H4E6tR7qG1NOpSJAHAZM0Nh08yHRQSKLvoBXgsg/zL5s2c3ixUkXTaeTnerUJXOK1mxSJd3MTmyb/3gFaDvtgxHlbzuJIDt/kBh72zXdwGtM4nevmm3eg8tOdGzwStJnp9KSPtyV/T3Ocq15VhTQzk+cRCwjoeW8xDu+Y9aO2fq/5WW1HZTzzagwNTAwnHXb4G8toyQ7DnSUjr6mtcbe5+4R08LU4yxOufXAQ2kBuU49ZKiVaUPQFWpB0xCHoh7sAdgAsemfWxaknGcs0Fh1/1UvF1hhACk3iF08uINZdIYnFm1LDRt+vys04xftnm+LryezIR+tVCtE2cIdoX02NbQVhTkqaRvbOxc1K6OqpOZkr0WEggnTkqBFHyMjjJfCuuCP6fGkPnILcekdJi9OJ9H5aeFkrUYbLipNGSLN/19wA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(6512007)(1076003)(91956017)(76116006)(9686003)(5660300002)(83380400001)(6486002)(122000001)(38100700002)(2906002)(6506007)(26005)(71200400001)(8936002)(6916009)(8676002)(66446008)(33716001)(64756008)(316002)(33656002)(186003)(54906003)(4326008)(86362001)(38070700005)(478600001)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GDnjTLiuwz0FEf3wdLTnVuSC/Tsz4XDEu8IRjIzhe9PU0fxXGqTQAH86bW?=
 =?iso-8859-1?Q?EkhbRE8AAifUyi1TTmzG1F3+JYgHZUYrM8WUD00QvZXHJpcXAqdlnIcP9X?=
 =?iso-8859-1?Q?FFxnyby/HixomQaLY7uZ164xnzQCVh7wwolJSTIOdmTZ+J16eLnAfrYclk?=
 =?iso-8859-1?Q?4VkH6PKUjul2NgLXc8tlu3z/1cKrH5+qoTmWqoXlN5uryUX4TtBaSmf/ni?=
 =?iso-8859-1?Q?bfuW+xx1YV9FcU7jxZg8Tey5fGhBRo9865mO8Ga0jrTrLSNozrtgs+C1bO?=
 =?iso-8859-1?Q?KVVKBKWfRW6KvnV2M1+TyfeUGKvwCYVYZeqPxqD1CVvCnvSNWtF6eSGptw?=
 =?iso-8859-1?Q?IYZAzRBPCmaZpEMgiBr3NHxvrFse46zEpvpBsskA3JAp9yP+J0MGVh7T6W?=
 =?iso-8859-1?Q?PJnqnyrcDzAZya9LqvqcX89exNRB3UM1EQas2mQNnWlbNKh1FBEgYqhZ+3?=
 =?iso-8859-1?Q?zl38yagsrAVtVC+foS4UItzKKsm2CdORUrfQomvtRsZk6KQvNgH9lXgDYc?=
 =?iso-8859-1?Q?nNHexsmfy9pfNaiaa8nC3zRujhiKxzGQsduhn30bhEjBFicgr8txgpYouA?=
 =?iso-8859-1?Q?EgoZBPZ0l/5nDfQpNgIbDBchQMU+Kl41d/niaChm5JOnO2gu2j2o88gJo4?=
 =?iso-8859-1?Q?amgLSqk9iH1EgsGDlEeJwRIc9ZaKOEdYU0bsMljBYr+BVmCGMJQsQnL4A5?=
 =?iso-8859-1?Q?X7Q4YfDQSgaOZOy0V3nwNph9FfymqpLa74DZfMwyI/MeddGLdyOfe771bK?=
 =?iso-8859-1?Q?+/yyiwMvSGtoGIvsMlS8TCTuCTRg9355GL/TmbYda8YQqYuQbRAboI2aqK?=
 =?iso-8859-1?Q?5P9ykRHSePEEs2oCklKwVDrBXOypKvSstV4yxsfEQck/qwePNmori5DAAU?=
 =?iso-8859-1?Q?191LdqVOG7E1Cjz6ZFBTUMU99SoGo/Bcr7LWlplrQFiAjVshFP4h6jFzGt?=
 =?iso-8859-1?Q?7bb2rpOAdtCjOARM8aXwnHj5JvTqEe3kjOB3vitt0j8mtk9LriDGHrN5c7?=
 =?iso-8859-1?Q?M7+4rrT+rqe8+u9fVUYrLe7gfI5Y9Rf6CLVTnwxOfdhT1Q1oF9vKsa7dvx?=
 =?iso-8859-1?Q?Aif7sfeTr7YJlZ2xBheWiKyGcnzkj1P29/t7JUQqoIwe7eXLIted454rXr?=
 =?iso-8859-1?Q?swXr2IBN6QJgpbOweQttKNEmOkv6sKFUUap+G8ktG/kwb1LToTLjb+wKvJ?=
 =?iso-8859-1?Q?WBsBxIVWQv4n9cHmR7zsZyA9GSUAqhGb6UhgHSxTqj2o9MWSdFKf/qCemr?=
 =?iso-8859-1?Q?2Fw5CRT8B8hduDA6vkzP/xuPDex0s8dFGBJI9DHf50sPSYsAjmEh5hZZh9?=
 =?iso-8859-1?Q?nqnqCMpoUFaCFsk+O3KVznYAsZaOXvoRv5y9ZnH2b++CBiqrXP3+X/d3wC?=
 =?iso-8859-1?Q?GggqWPACA4nyd+HmJ87NSEjsQC6LxivQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B59AE27AD2181B42B90F6B22C8729068@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d743e7-3693-4a33-5ae2-08d9741bd6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 05:28:36.5536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qClEsk2avSPrsMHPB1e+I7Iu6pL+lGb5ldPvuTI2t/lFXAdlURsTgPDVikLd/Te0RJpOr0isoagcFjN7iK0awQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7911
X-Proofpoint-ORIG-GUID: 2YMTWI4tRxHxlBSSH74D0TJNG75M3DCz
X-Proofpoint-GUID: 2YMTWI4tRxHxlBSSH74D0TJNG75M3DCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_01,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100032
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

On Thu, Sep 09, 2021 at 09:04:05PM PDT, Jeremy Kerr wrote:
>Hi Zev,
>
>> However, I think I may have spoken too soon regarding the relative
>> simplicity of implementing it -- from a quick glance at it, I think
>> I'd want to take of_device_is_available() and split it into some
>> variants for strictly-okay and okay-or-reserved (and similarly for
>> of_get_next_available_child()).=A0 The problem there is that there are
>> currently circa 200 callers of those functions scattered thoughout the
>> tree, and auditing each of them individually to determine which of
>> those semantics is actually appropriate in each case seems...a bit
>> daunting.
>
>I think you should be OK, if you stage it this way:
>
> - add status =3D "reserved" to your device tree; this will supress the
>   automatic binding right away. With the current code, all it cares
>   about is status =3D "okay" (or "ok"), so you'll at least keep the
>   device quiesced.
>
>   with that, there won't be an easy way to initiate the driver probe,
>   but maybe that's OK for your use-case if you're doing the bind
>   manually.
>

From some grepping around it looks like the only check is for
"okay"/"ok", and nothing actually checks for "disabled", so I'd think
any non-OK string (including "reserved") would end up being equivalent
to "disabled", and hence result in the device node not being
instantiated at all.  (A quick test appears to confirm; with status =3D
"reserved", an attempt to bind via sysfs fails with ENODEV.)


Zev
