Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B048B3E06FA
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 19:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfzqX4TRNz3cSv
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 03:53:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=kynWtDcZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=9850d0504e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=kynWtDcZ; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfzq64npfz30CG;
 Thu,  5 Aug 2021 03:52:49 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174HhfRj002759; Wed, 4 Aug 2021 17:52:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-00268f01.pphosted.com with ESMTP id 3a7udk9454-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 17:52:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKZMvRk/S96gv5bnAtxx0MXpQHcHeanxDzuWkebzLCOlrlxLR74/g3zpsnkrOcua7G3IJe1brM+zxTsP3t5jJyJ/dzYh12P0CcGZjm3Tl44/q+hndXsLdDyyyJwFx8a0mlNnDM0ED9i9gD9xUwdhAhmdn3w0GJKbTStcFsfxwOt6v2Tzgpsga+bgGvF/CnsxSd1sVVkfK7WPxlsGpvgUnsMcvOzs5qaWpzdk/WSv0Rbmwv02ecnzvPkMbMib5zUZqJbQ8C/1OGJkgreb5/lc7up1os/qIqJPrf1GVaecRUTyxVy6hgorvhzr3/Uoys6nuYYT2OO+yrSh8cwZLBQS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws0T8edmFGEpvJbTFRLM3IuSe+htfm3KZxzvmMyRa4A=;
 b=c5Jbr6COpvDkLpyB2K6X9P7TfMvLGp6IEI7r6R+nXyrk7wO3xcJPEJrY2hsb0Uxw0kp4oTb6p0+BThY8Yk3a/7kiudRuA22tGCRGAZTor+nqqxao92sragjSmwqSmmtLyDlQmlTiA7pNio11AoMBQUno1PVbo8xPEAJYrq4L6PVi2Ucd/+NKJTwEwBlrC7Sif6tYLoyT+9G7rqkIhnD9NZEmfqdWOnQYwHDajkTVPX34w9a+4Tws+s8xyPzqRXaKC0z8ieEqVaieHNfRCdv6hPNfEOe1yXC/Bl8GkoNdaIJOUwx/+ftikimOMvxeMHGCd+pGpxktX69oXO4J/bq0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws0T8edmFGEpvJbTFRLM3IuSe+htfm3KZxzvmMyRa4A=;
 b=kynWtDcZaHbvZIRGwnZwnz4Hv+NfyO162H6gjk9jA7b/5YkhnecwQXSUUc7mpXSbvcYM82ABb40NNEPktRIHqfgdzHJ02GBkMH5NP2dEWb9m47toCaef1fkWw5kqTAAdk7KHZNvszLw7dUyzkdl1tYhnBkT7DyCkec0kmNwm4A0=
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7861.namprd04.prod.outlook.com (2603:10b6:8:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 17:52:04 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::953d:f9ec:b2cc:ca2b%5]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 17:52:04 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Topic: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Index: AQHXgzrekgBvAebmGEm7GzBex72boatgHxcAgAONUIA=
Date: Wed, 4 Aug 2021 17:52:04 +0000
Message-ID: <20210804175203.GY8018@packtop>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
 <20210727225808.GU8018@packtop>
 <ea5621698508a800cea59b5533f8845b9f0befc6.camel@intel.com>
In-Reply-To: <ea5621698508a800cea59b5533f8845b9f0befc6.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32988136-f44c-4741-f0c2-08d9577091f9
x-ms-traffictypediagnostic: DM8PR04MB7861:
x-microsoft-antispam-prvs: <DM8PR04MB78615EF9FA4953BDF5E703C2C3F19@DM8PR04MB7861.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sPJ3r3i0D2yimqvA+xPs+umPt5ieR6qIhB7EIcjbphFCPgbpuu5TfsetSHjUy8H7NiuiCZ2p2AYNdT+rDDrADodfhZj3/PX3ktE5iZxRQjwifCIaT+8ucW+y7Amj/9Neo1E+DVJUPDMOAW3fvmzoXJ0MSdgRZbmp23Z/nvQnMqsHzBgfrLllFqqDLhc6Kx9lkmgBTZhBkJZXJNnkCcuOtNbDhZ6k4H1oVhoBhVwac4a8GRHthAh4/fruLJf4DnIUPBbgponl6GfKrzR5R4Aukt1FSjx/f30XJe9hJfJ3rnRQ5tx0IcU+Ic8UKvP9/Hky/TEFiWOkPHCRGVrF8EvmfHF/IWNzatFsFJvXnXJ2OsXocrN9QTA9TRrt136AYJOUpe5BPnWi/Td0uK70TPRMmOnvtU105mXeAtomR+CNSnjSdUOAG82KH/nVDHXHDbA2mhSXr3Fm6xoZ7/1Zi2SIe/MCmbrOdVNzf+YBu859/0K299PAN1rUYhAC7ALS5dSQ+5iWylCDnHBGyF0ao8999ctzkLLmBFDKMQZVeJ1zOTpH+uSSN5ByUHdYDToVNorOaPxsRkuRB6r6TD611y5Kw8vedafxDKM5RC8cQdrEeVKejgDvB0yCwedBNYK3RRQGedKR393TPLCWphrjxrDUa4j964DwPNrDdvy8VMc9rKRETRbvkfOJbHuM5qAe4FF3a9fJfqHx67bNjrkHbevQosC7t88Na/8b/N/JCmrIHqVrREVPMsu03LVk4ZFAQYEuuiCoqY2chjb2hq6fexeqPW1XwOy6PmVkF+NXIuHwopjLBN6q4dsrMCBeGoJWhOa6UB8IWFF9FT3dwXRYtp4cPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(2906002)(86362001)(186003)(6916009)(83380400001)(54906003)(66446008)(19273905006)(38070700005)(33716001)(6512007)(122000001)(8676002)(478600001)(71200400001)(66946007)(9686003)(1076003)(8936002)(26005)(33656002)(6506007)(76116006)(316002)(966005)(6486002)(38100700002)(66556008)(5660300002)(4326008)(64756008)(7416002)(66476007)(562404015)(563064011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H+l03xqj2XBsD2ZBpGvYnmCK/9vjwZ6LWX3TqK7g1YkpTqgZyklRQdj4Rs?=
 =?iso-8859-1?Q?4Owx8z7d41cEV0ZgYizNbpJpyllqwhG0PzF8en91cknrbdcMFS4xIg5XT7?=
 =?iso-8859-1?Q?gu9W1Co/uAV/vtwSKi6H/vIc2Khc9kPAZwJnFOWeLLJ85Y8kMVJQ3pj0Zg?=
 =?iso-8859-1?Q?5iz41Rw1/RRhrcACMRo+Ywng5VvICrQEux/Uh0HEybWxvRBn8Rcwxe6xv2?=
 =?iso-8859-1?Q?I2bNiyD/+e2sPRHI+BUYSYPmrSy/PbgPxiixl7dcXiWXrVkwh9C0fV8v58?=
 =?iso-8859-1?Q?DQ1sxzR9Rx9fYp7rzlWeIJEM7x+tcpAPBTfCF/jgbZF5v5GlOrzJ8hSr0c?=
 =?iso-8859-1?Q?1rNv4OGOSW/VJchirsP0ztCaQ81D4204H7vg8jD0i6cqZvhnjbZDFV9g12?=
 =?iso-8859-1?Q?hptjOo/FTNN5TPLnLOGC7tIuDsmilp0PbNab2mmziJfITmrgf1Tumeeq9c?=
 =?iso-8859-1?Q?bSX/6TUyaCeiQ5irMDSd6r9yeiHLnV0CJtkj3d9G8IUOYiDFGhun1ALFrX?=
 =?iso-8859-1?Q?wCZJ0uoi1DLifHEtMV9S7eFhvxFWII8AodmLkGCt3nijLaMrxt+jUFLV9D?=
 =?iso-8859-1?Q?e4N1el+YR3cVMEKYenIVMWSNa9/7HrNGiCxyVOxZddHSMwV0Wf/dMEeEUe?=
 =?iso-8859-1?Q?BUvSKa5pKscRBFYgBshYwEKBq6SWazC+/Zf1gau1uELtDSbcfiV/frB8s2?=
 =?iso-8859-1?Q?/T38dG0ooQa+GwbGiAkchZDhP1RoVHHY/5+/ih4LeeH7RF8Er7zVpncU3x?=
 =?iso-8859-1?Q?e9Ohd9xybhqBlL3sXyVgziVbePqJh7UNL6/FScrUjdxXsftILJMTaflTkb?=
 =?iso-8859-1?Q?1DNWAh3TUqTGGtZ1AlbH+AjgqcVX6ZcAqSDGoPfWFsLsA3aimfOLmrAxls?=
 =?iso-8859-1?Q?n8pWFm9/qttyN/g38h3yUPzAsH6SpNd3wGiqSCpEBlf0dccO/NomFTrUKd?=
 =?iso-8859-1?Q?nZY4o2f8As0yzv6jE1Goje+fCGk6vdNK40UZBzoQKgl1iIRCjj8rL7OsPE?=
 =?iso-8859-1?Q?ZRcTXEYsTwezgU2ojFzBWjBy+u6FtS+bqpfkkXoTOUH81V2+wWK7LYQFJP?=
 =?iso-8859-1?Q?MgzzTYdAwUDhd6f2lW8w5QgaiEZOz6nFHGeXCVFy5UQTDEAN4jqlCyAs8P?=
 =?iso-8859-1?Q?The20AusjzfP/wY6fjTY74/U7caPYUwIEIQRdxay3itDYDKj130p3yLDMv?=
 =?iso-8859-1?Q?w8iNbQLbIwUAfCK3QuKtvpjyk6mh2SxrdgFn8tons9ZGMB5iUDE8U+0z46?=
 =?iso-8859-1?Q?hL1I4Xw529bs/TBOAxaZ+2EgdnF2ya9us3DiOf5Fg7yd8BUtyyvg01Ww/y?=
 =?iso-8859-1?Q?6eXRcfH6xi5GaLurUDg8Uw2BFkS3T1EN7c4voPjKY7sbBkfUq4RhK4mTHk?=
 =?iso-8859-1?Q?vKpM1JlGPU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9167364B135B50499B7439DCD8A4F974@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32988136-f44c-4741-f0c2-08d9577091f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 17:52:04.5381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7h22H3T7VbbSThpLYtXRj6dEuVS2J2r7Jw0s0A5tlkdEI5TnojMObBLgxsDGv/FrzWxiSeEJcKExfEgDmJ22g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7861
X-Proofpoint-ORIG-GUID: -X-8wQYwAVmFKde3JMJQRmkmrGP5rzKa
X-Proofpoint-GUID: -X-8wQYwAVmFKde3JMJQRmkmrGP5rzKa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_05:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040103
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 02, 2021 at 06:37:30AM CDT, Winiarska, Iwona wrote:
>On Tue, 2021-07-27 at 22:58 +0000, Zev Weiss wrote:
>> On Mon, Jul 12, 2021 at 05:04:46PM CDT, Iwona Winiarska wrote:
>> > From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> >
>> > Add documentation for peci-cputemp driver that provides DTS thermal
>> > readings for CPU packages and CPU cores and peci-dimmtemp driver that
>> > provides DTS thermal readings for DIMMs.
>> >
>> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.co=
m>
>> > ---
>> > Documentation/hwmon/index.rst=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +
>> > Documentation/hwmon/peci-cputemp.rst=A0 | 93 +++++++++++++++++++++++++=
++
>> > Documentation/hwmon/peci-dimmtemp.rst | 58 +++++++++++++++++
>> > MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +
>> > 4 files changed, 155 insertions(+)
>> > create mode 100644 Documentation/hwmon/peci-cputemp.rst
>> > create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
>> >
>> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index=
.rst
>> > index bc01601ea81a..cc76b5b3f791 100644
>> > --- a/Documentation/hwmon/index.rst
>> > +++ b/Documentation/hwmon/index.rst
>> > @@ -154,6 +154,8 @@ Hardware Monitoring Kernel Drivers
>> > =A0=A0 pcf8591
>> > =A0=A0 pim4328
>> > =A0=A0 pm6764tr
>> > +=A0=A0 peci-cputemp
>> > +=A0=A0 peci-dimmtemp
>> > =A0=A0 pmbus
>> > =A0=A0 powr1220
>> > =A0=A0 pxe1610
>> > diff --git a/Documentation/hwmon/peci-cputemp.rst
>> > b/Documentation/hwmon/peci-cputemp.rst
>> > new file mode 100644
>> > index 000000000000..d3a218ba810a
>> > --- /dev/null
>> > +++ b/Documentation/hwmon/peci-cputemp.rst
>> > @@ -0,0 +1,93 @@
>> > +.. SPDX-License-Identifier: GPL-2.0-only
>> > +
>> > +Kernel driver peci-cputemp
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> > +
>> > +Supported chips:
>> > +=A0=A0=A0=A0=A0=A0=A0One of Intel server CPUs listed below which is c=
onnected to a PECI
>> > bus.
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0* Intel Xeon E5/E7 v3 se=
rver processors
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-14xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-24xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-16xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-26xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-46xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E7-48xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E7-88xx v3 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0* Intel Xeon E5/E7 v4 se=
rver processors
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-16xx v4 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-26xx v4 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E5-46xx v4 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E7-48xx v4 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon E7-88xx v4 family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0* Intel Xeon Scalable se=
rver processors
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon D family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon Bronze family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon Silver family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon Gold family
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
Intel Xeon Platinum family
>> > +
>> > +=A0=A0=A0=A0=A0=A0=A0Datasheet: Available from http://www.intel.com/d=
esign/literature.htm
>> > +
>> > +Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > +
>> > +Description
>> > +-----------
>> > +
>> > +This driver implements a generic PECI hwmon feature which provides Di=
gital
>> > +Thermal Sensor (DTS) thermal readings of the CPU package and CPU core=
s that
>> > are
>> > +accessible via the processor PECI interface.
>> > +
>> > +All temperature values are given in millidegree Celsius and will be
>> > measurable
>> > +only when the target CPU is powered on.
>> > +
>> > +Sysfs interface
>> > +-------------------
>> > +
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> > +temp1_label=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0"Die"
>> > +temp1_input=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Provides current die t=
emperature of the CPU package.
>> > +temp1_max=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Provides thermal c=
ontrol temperature of the CPU
>> > package
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
which is also known as Tcontrol.
>> > +temp1_crit=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Provides shutdown te=
mperature of the CPU package
>> > which
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
is also known as the maximum processor junction
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
temperature, Tjmax or Tprochot.
>> > +temp1_crit_hyst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Provid=
es the hysteresis value from Tcontrol
>> > to Tjmax of
>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
the CPU package.
>> > +
>> > +temp2_label=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0"DTS"
>> > +temp2_input=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0Provides current DTS t=
emperature of the CPU package.
>>
>> Would this be a good place to note the slightly counter-intuitive nature
>> of DTS readings?=A0 i.e. add something along the lines of "The DTS senso=
r
>> produces a delta relative to Tjmax, so negative values are normal and
>> values approaching zero are hot."=A0 (In my experience people who aren't
>> already familiar with it tend to think something's wrong when a CPU
>> temperature reading shows -50C.)
>
>I believe that what you're referring to is a result of "GetTemp", and we'r=
e
>using it to calculate "Die" sensor values (temp1).
>The sensor value is absolute - we don't expose "raw" thermal sensor value
>(delta) anywhere.
>
>DTS sensor is exposing temperature value scaled to fit DTS 2.0 thermal pro=
file:
>https://www.intel.com/content/www/us/en/processors/xeon/scalable/xeon-scal=
able-thermal-guide.html
>(section 5.2.3.2)
>
>Similar to "Die" sensor - it's also exposed in absolute form.
>
>I'll try to change description to avoid confusion.
>

When I tested the patch series by applying it to my OpenBMC kernel, the
temp2_input sysfs file produced negative numbers (as has been the case
with previous iterations of the PECI patchset).  Is that expected?  From
what Guenter has said it sounds like that's going to need to change so
that the temperature readings are all in "normal" millidegrees C
(that is, relative to the freezing point of water).


Zev
