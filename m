Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C02406641
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 06:06:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Mkm2lBHz2yPg
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 14:06:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=JQF2dox5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=088761d2b9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=JQF2dox5; 
 dkim-atps=neutral
X-Greylist: delayed 962 seconds by postgrey-1.36 at boromir;
 Fri, 10 Sep 2021 14:06:15 AEST
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5MkH5QTQz2yJd
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 14:06:14 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189MRvR9024494; 
 Fri, 10 Sep 2021 03:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=np+PNIPKoYjG5aYO7fywaT+aEtEEg/Wn8j+FLRgyOf8=;
 b=JQF2dox5PoYqwBpwJjttDLcgac6ZvAklPlZRQkVBQfyGC4JAN6/1YFdxW6AmqeVzXFfd
 t9wEkMA2p51WPalxaga6apfeadgsXN/iCyP5KOV9vf7eUTK8x/7CHL5CecY9kLlyQU1C
 D7PDRvlBXDt993K3K5opwxHYtHAhD3YhunzBD057nrxAPYDN2ttjgx7flBdzWUDuB00I
 YEle2292qADraoXxtwWazEzm8gcILkDgm5KOXDPIfHBEjcGfHD2nhbMWzCecK+M4PGGt
 2URlzdUSWsTYwQ3Bx4nefVY0hlDr3RlK8tC9tKZnPHIMhYHOU4vZYGRcztP16NMI+Zcm NQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-00268f01.pphosted.com with ESMTP id 3ayttg0wc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 03:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfT6yWfiUFu3uT0SlSQFSOanyR/dtAWJrA7E4QjRbPieNVgALbcOqAHkZ2GQj6k0It+JVwcBuK2cQowMjZNYl2FOtNJxhasqreKbUpRA/DRxhGzNDqdDNkJC9+Ia2CxYJJ1rR2GrXCgzVCjjcbigAWlFhkArlkwYuFpqK59p7Ty8cLY0CTa7NqmZL98rKjfARUIjdhUX+E05X8kXrDGprKQQTXUElvaoSCFWE/Ol0t7j4LLxEHThjO4H6mRgXkiLKSLIEaFSf1jEng7o2zqwWNeYepCc2FBMRpGC1ySNzKvxZnDNU9mEQb1nISX7O5J+axfOOv1hxt328NQcS+WJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=np+PNIPKoYjG5aYO7fywaT+aEtEEg/Wn8j+FLRgyOf8=;
 b=X+e4hsDUyfu3GmlGSad9dTeYOr9iSTzHvRqXtvCl/07WjdjlF1uTqLqERgpY65+yoBlLcA/oNHIQAp2L8OwZ4vM37TNpsGThZozrMrFrBweaXByjlr6k1P01CL2ouYBW7NHbSRhB2nqTiRaMkmx6JBZATvSmOv6qXtHbwtmCxC1dQd/LgTthGQF35cXkOWagfWsVU9rseyh6lY7JLGGShWZyvWJPa/D6X5vTKrovqWE3dz4Y2ltBQY6TGNZxFxjKN50I2jDg0LvDBGcB7LU9L5BdSyNzcr0PfF7EMOx1uG6O1opMjVOZHzeoewWixlxkmdr9Y6xBjlRJAX2iJN+Xdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CH0PR04MB8002.namprd04.prod.outlook.com (2603:10b6:610:f8::16)
 by CH0PR04MB8098.namprd04.prod.outlook.com (2603:10b6:610:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 03:49:58 +0000
Received: from CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::106a:a14b:6340:4196]) by CH0PR04MB8002.namprd04.prod.outlook.com
 ([fe80::106a:a14b:6340:4196%5]) with mapi id 15.20.4500.016; Fri, 10 Sep 2021
 03:49:58 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXpfbsGE4mF6LuvUelZF3ZjDuTqg==
Date: Fri, 10 Sep 2021 03:49:58 +0000
Message-ID: <20210910034958.GE17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
In-Reply-To: <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa546f8b-b829-4288-bf5d-08d9740e0f72
x-ms-traffictypediagnostic: CH0PR04MB8098:
x-microsoft-antispam-prvs: <CH0PR04MB80986DA7B5F2E111923DCA6FC3D69@CH0PR04MB8098.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJKFxcGoJIQ5OXzHWXtpCXpwY9p2r6/FV12KigogC6pVDtSX2NJpcpkGXA9jEercwLksRGPZ+anrQAoBSZmlnufs8iOD7dtrwNyYmIF/zOal4CX3JugqYpX07pRjTwkMM/CSgkzfg3UotOjWuqoZMAHbRYE6vu8v/7I02c0k60KyaueoRSI4vldaMBqFYLiuziq2KpUeV566ZtbR7u2C6DJklmPzzoKYUM2BIMbwwiAojHXuacMjevLJ9vxM/YKSmm+H88pOhqdZfzcXSGoZLipwDN09eoGOxc7ASjcr9NebACo2CzCi0miS5XpMVVISPlhULglcD3RapHZg9HBR8nK9SHzDikaa7rpmIkApQ0OX18+ugS6PekVJ3xNJubi9QI4uSPWYe/igKDqiClilHgVitLmut/UHzp8Gi34vKZ1sDwndO//d97Lbbi3JSEL7Yp71NsE3IrVnsq7lcIEer0eH51uO7+raLZjwl8iw6oOsaV234AMLlftYjRBVd5cVm4EzlXY/RdxoatueD0Sk2F/OpHaH7LmGFKjG+YQi67LFTGCachpMGroND14AvgXNQjvyaSVVgvPkgYj1o7ZzYAFYvBN6jzwE+3EOIQw8SD7Evg4Yz37SeZoTjZGJ/6zuv2JFP+IPhbNNbV2oIS+0Dv8Oxkrs4z/uKu3N6SxprqJIEWKOMVDMFJvEQjZjPTDQMiozVdqlf1IXcNVbb1haEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR04MB8002.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(54906003)(38070700005)(122000001)(33656002)(8936002)(86362001)(6486002)(9686003)(6512007)(71200400001)(2906002)(66556008)(83380400001)(1076003)(4326008)(316002)(38100700002)(33716001)(478600001)(66446008)(26005)(6916009)(186003)(66946007)(8676002)(6506007)(5660300002)(66476007)(91956017)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VYqyail1lZPgy85uUvRJFhd3uW4X2CfTtnm4uPvPo7hxDrQL9KOIvvYBtdph?=
 =?us-ascii?Q?ynvupi1Sy9KV1lMVJLVRUsD/m79DD8hIgZRvSOdxTXAqoUUAPjkzWC/hfGtB?=
 =?us-ascii?Q?6RLAZlGoBLlXmkQUuKXA6OnTOcXRuc2HKvf2jntAcvbOlK9pta/tz2mRHRjA?=
 =?us-ascii?Q?VfkpXQW9sdV9RbKwMAhmTmSydLDtcBU2BELcSeXr6urR/2HSC4Ky/O5MMmxB?=
 =?us-ascii?Q?fpAbce+wByLwG39Z9yNZ4JMqZA/MQ0Ug84bAS3WK0s77WZQqbMgQwlOHyBO/?=
 =?us-ascii?Q?N5axgWJ5tr7Xr60oZSbhDiugTclcVqks3lpU69xWzA2TgwKkTyk91Qd/biHQ?=
 =?us-ascii?Q?iCQn3jRTJJwTWUElpvUZPu4ro6DzdyfMKC9odkwJjZPtAcSRMGfckityA7Dp?=
 =?us-ascii?Q?qJu25ykEVwyczx7xyp6pGxcphgtiIOfbXiOckaqLjB7nHCXA9MOcfTQ/hp/J?=
 =?us-ascii?Q?gR9hWDGYuHW0duSyend4HzBbneRirCLLstvutxicjJGFp7ArCILAHOU61vft?=
 =?us-ascii?Q?w6tuLIPZhISoXXWJrUPm65eX04nYLAg8ooosRqKI8/4A86Y9yYI2PHOY2zlT?=
 =?us-ascii?Q?UjYOWw1NRaTGCkDCV7dU4USC32SXC3perZV3MzjYD6inpOlN5cQfcSqiz0l1?=
 =?us-ascii?Q?ADibRg+k7sDlIPdKS84bGZ6AVaLfGhrpIih7Yh4E+G6pkpDuNUBGC2Ip197r?=
 =?us-ascii?Q?bUEd2zVuRIOOhexAv9FDMLlAFiegNJ1lYLgBPxwwcQ418FsLuJVjZ3YIG3QR?=
 =?us-ascii?Q?/XGQsXq4+x4Z5dhq9hwejPEcqeV2OUZERwDGSU17DnjVJ7q4H/GnsWnyXbnP?=
 =?us-ascii?Q?YkCw8AZCLTSSXNLI/9ApINja1AWiImuzx3288jXyP3ttClc+rLmwuibfdRl/?=
 =?us-ascii?Q?hWHjKfo9Z+u2cWomi5tvLiZzDu8cIMlW4b+NlkPI2wC7slmBVQjWS8iwR4ji?=
 =?us-ascii?Q?PU0fe+39urf8gQq/2ARwtbAdzdEBp2Xl0E7wEKUQ6ly17K5YEjQsR9oKx4b3?=
 =?us-ascii?Q?Egjqb8Ar8ar3bbndp6mXUnVzPzs6xw7v/eyLfdxpYcd3CGymxGJ66yTPQA5y?=
 =?us-ascii?Q?W4c3213DyfdNcpp74IveR0vxii9qij07jnzvSqo5RA0NwKg9GFR6RSe78O3M?=
 =?us-ascii?Q?5GKQK7g8L9naTPBOaNWIlNYx28tDBu3EHPXymKYyNlP0VKlDnQ4xbsMcXo6O?=
 =?us-ascii?Q?zP7mrD3LHKfGdvb5BF7nuDhLd6srrSLmpt89kOcEIsCYNt8+sWAAwE5Ww9wD?=
 =?us-ascii?Q?DkCwc3SimLPdDGG3G3o8kfgAyQlfx4QcchL8VJeqKA/fD9I0tjpEjHPl1018?=
 =?us-ascii?Q?WY5tdf6wDhNDOVV+gk0X7hNnMc/pLTAl8FsCSc/GhzTwqA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BD53108B115DB4A91AEAF12069DF09B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR04MB8002.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa546f8b-b829-4288-bf5d-08d9740e0f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 03:49:58.5545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTRgQKqG8/xrIxzvhKP96VLDvxr4+Qi52K8EuyTvYEBJQrzRqChsVnUQePzIMDwCENyAE8zsJ4xzTxkNNmM3sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8098
X-Proofpoint-ORIG-GUID: NvZGIuyW40rXaxWvUZY8RDWUSwwjIXKI
X-Proofpoint-GUID: NvZGIuyW40rXaxWvUZY8RDWUSwwjIXKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_01,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100021
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

On Thu, Sep 09, 2021 at 07:33:42PM PDT, Jeremy Kerr wrote:
>Hi Zev,
>
>> I'd like to hear people's thoughts on how to approach specifying that
>> a device is present, but should be left alone by default.
>
>Sounds good!
>
>> The other alternative I've considered (though not actually implemented
>> thus far) is to start using the "reserved" status value defined in the
>> device-tree spec (section 2.3.4, [0]) to mean this
>
>I'd prefer this approach - it seems quite neat, and means we can keep
>the hardware definitions together.
>

Yeah -- I'm still on the command-line approach at the moment basically
just because it was the first thing that occurred to me and has worked
well enough so far for my purposes, but I think I'd agree that the
"reserved" option seems more desirable overall.

However, I think I may have spoken too soon regarding the relative
simplicity of implementing it -- from a quick glance at it, I think I'd
want to take of_device_is_available() and split it into some variants
for strictly-okay and okay-or-reserved (and similarly for
of_get_next_available_child()).  The problem there is that there are
currently circa 200 callers of those functions scattered thoughout the
tree, and auditing each of them individually to determine which of those
semantics is actually appropriate in each case seems...a bit daunting.

>Do you have thoughts about how you'd then un- and re-reserve the device?
>

I hadn't been thinking of being quite that ambitious with it, I figured
it'd basically just get used as a boot-time-only flag like my noautobind
argument, and beyond that it would just remain reserved, leaving it up
to userspace to take it in and out of use via bind/unbind operations.
AFAIK the fdt is (outside of things like DT overlays and such that I
don't think have ever hit mainline) currently an entirely read-only data
structure at runtime, and I'm not sure what ramifications there might be
to introducing runtime mutations...possibly not a big deal though?


Zev
