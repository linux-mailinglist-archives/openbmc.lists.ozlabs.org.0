Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABE460E31
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 05:56:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Y3G5WjYz2yfZ
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 15:56:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=KVgcAswa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=09630edb59=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=KVgcAswa; dkim-atps=neutral
X-Greylist: delayed 1143 seconds by postgrey-1.36 at boromir;
 Thu, 25 Nov 2021 16:35:38 AEDT
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J066L4Qkyz2ynM
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 16:35:35 +1100 (AEDT)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP3oBQL019382
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 05:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=WBfIGE4rOy4JaXclEkqfQPJHa+5/65GDqRlpimLtp2E=;
 b=KVgcAswaxPLOvU8C5K6o8y2H3tslR56eeS/rertgXM+7AW+yraD+/pfsgG1gFfZVneK+
 1XMzLtFvKN8tekUlYed2wFmupY4TFv1uVUSg5q4eaIUufQgA8tIbtfRuA7+rJaXndcQH
 5RmS30jSoZcH5f/I5qZz14HmnAvj0xvFib6X2zNSS2LK/h5oAoZdmk6ZDpP0927+onvA
 90lfk76W8v0il4I/57HzMSv+S2obEFsSs0fL5fgpVLwKzdvYBCmmDt7afDrV0fKz7EHP
 BEESfM7X5J+iZchV96UMYUF+k0jVR3uOjTO0i+ie2uaVoogkkIjeESC3Rbrq0Jphrfr+ NQ== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
 by mx0a-002e3701.pphosted.com with ESMTP id 3cj2xbrfhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 05:16:27 +0000
Received: from G2W6310.americas.hpqcorp.net (g2w6310.austin.hp.com
 [16.197.64.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 26EF551
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 05:16:27 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G2W6310.americas.hpqcorp.net (2002:10c5:4034::10c5:4034) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 25 Nov 2021 05:16:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.241.52.13) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.23 via Frontend Transport; Thu, 25 Nov 2021 05:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBgYuPXiZjUi2cpdXn3vl05qrTbaFjTjWq3or9tp4c6IH/L8PwsZ3MoLjFdbXDcWaRI9I3gp10ARz8qoVzGbNO9rKLLIGRPTCM01lSq5C/K86EtIf7Ykb8mhCFHtEwusVk/YT7OlmLDALELmyr6BPuMmKUCeQCMoRV2cfdg9yzwIBKzDPslWJVET8qMDqHm6O2O34wLKYqi2mKqq8x3ku8WgnvVP6OHJ483JOZIitNjVVgMcLBAPToXll21/PkX5Qr80WcGJmzQkvgXXSJPao46VzDh0StOYpQs5gtGP9SZXXGf0KU578bw/KqlXStQTROma241t8rjoENmLzDTYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJfQQrIA63YRvATXn3Q6FuuGueqgYRDsurwyMW79MVo=;
 b=WvF00rXaJKrdixgdpwBMs1+t2T79Z5zO5Y/VRis1GzHgbnxQiQ2yXnIWSRMryYFidMHMWozDTo3QIk3lU+PDTqAHhUv6ISf3QvIWHEpRTAOV0Vq0abwz++IHbPKAJ44hPQGcu3jPQm4behzuBZ//mmgPmk2p6v5hySMJHKhJ9cSxCmdJH7j7kAYIVUeUxw9EhQivpllRVYt8E1W6hC9X/zc8jOL92ilw4u75ccxL/mvglBJkmf5d7RetyRj/1toKcWNz+cIUmytXwBlsLIcf7//j6hingeb+sDOWTxuNUaBoFE71NHsmRuX3VfRrZocJaMgV/P2D2/1L0EoOK8VOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760f::11) by DF4PR8401MB0507.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7605::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Thu, 25 Nov
 2021 05:16:25 +0000
Received: from DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8d55:9e17:6949:ba3d]) by DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8d55:9e17:6949:ba3d%6]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 05:16:24 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Romulus Build error in phosphor-webui
Thread-Topic: Romulus Build error in phosphor-webui
Thread-Index: Adfhu5Vi3gUJnWI2QV+HpP/o6pp1VA==
Date: Thu, 25 Nov 2021 05:16:24 +0000
Message-ID: <DF4PR8401MB09557853DD75C419B6748824D8629@DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f47bbe3-179c-4750-f6fa-08d9afd2ba17
x-ms-traffictypediagnostic: DF4PR8401MB0507:
x-microsoft-antispam-prvs: <DF4PR8401MB05075DDBB95712C9C50A7437D8629@DF4PR8401MB0507.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tYEE7fpmRymU3auRq6bDy2zkx5TNsnXIcCuAPde0HhlXK9gyDSOiGMMFBYT7jo554NmmgvI5QBrp5lP/Ex66JtMlRaO2M9uoZPfmYBu+h+z0JwJF9vtdvNoPiVJNd62OYNxMhGQbKjP8rjO4dvysihF+X7s1w6LKJ1KDiEKCtkElOj0bCO92yl9t16dey0TgUAINnFw04eDt99nXt8qkyHxKv9BRBzVd6KC+C9YTj7Scf/s08huAhAy8/dJZ0L+m3Zc4NrNwoie3a/pMMKHcYBhdm+DrwfW4oYml58WRASZPSYewwcWXaXDHZP0A0ij4PV8dywcQwZxt1eEAS+aG67gqjFD4liPZkG6FuqwbwJQuwdJ1kTlWuKkWt25c6ncB5w+rxJn6U2OcoJy3p4wbh9hW4i3bA5ByyLCtg2Y4tcI0wTYcaUyrbOb2OavvnNs3I129bVd0BpUnyL5ukflGtBrmobPbz3AXEX1maCCWaCYmDOM+MZ/Mok71kDrRoMRhpb4GHcqpQLAR5z1FP9i7kdODA4h/G2aCJL3RwjBGNZGp9iNlKjRfyj5xoV0F44kIzoCiivHAnTzfgi+ETrax3vgH4hjf0rQUT1K6EAmveKNGjKuxAUmcsd0eyeeTto9WT39rHzRxddKYKpiU+Ww8ORUYqCvzvDXknX8Kzqg8tXxJEvnbk+GoSF3YPuwLNaafwxZrPfa0ELQtWgEXFt/TUGgnxhB8NZ0S2BQVcQxKzPjcHwiQlNVCWLOAjqMstwmkTFMv4g10motipDG3DZ1ISEJmVP1T5yVybpgz9WTNNpB1CAk9H0G4W4IIpDsfo9aib09MS+qeSj2nxQhzm2W8DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(166002)(122000001)(82960400001)(83380400001)(66446008)(8676002)(508600001)(966005)(8936002)(186003)(2906002)(6916009)(76116006)(55016003)(71200400001)(6506007)(33656002)(7696005)(86362001)(316002)(52536014)(66946007)(5660300002)(66476007)(66556008)(64756008)(38070700005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ARzFoe0vyd1/mHgU/eJFIhogRt7zRlAB40T6GcvVXxUDH4DduJiBmnEQD0wJ?=
 =?us-ascii?Q?JWavAMFBMCnRgo9TJCiPl3jT1jFYq/Y1C1iPYxBUE62RFCyXiJyqa9rFogYo?=
 =?us-ascii?Q?3kvPd9xtVGwzr5YBrM3kJ5Epqnhfm/x3cW118ijSOa6snoEVWbwlp8IrUMN7?=
 =?us-ascii?Q?3c899FlgdaGx1RvHVDAKqlG50BeGDyD45liTLrWXZV2XP38vxflZRo4yYLYu?=
 =?us-ascii?Q?W90lnwS99OZPOQrwCUDN6y6bQhJkYtwzk73BobKPt8OHHOtxwEywhg8QGAVu?=
 =?us-ascii?Q?Ngs2vaqJK3lB51ul/RMp/wGhnaMpcFYhl3iK44JbxBhamYN0zaGIfNqFWbKn?=
 =?us-ascii?Q?7IYSorcS53ztXxEtAq6BpOQLx5VGuu+l0wFiJ2BFFmQQLdzvnS1o3lnxbE9o?=
 =?us-ascii?Q?2Sm+OGqV5qRu84i1dG88ClbQdOQ8AjQGeph/6s3Yghy7XYqJzEHzvsWztIxu?=
 =?us-ascii?Q?solfV3Dm255LWPreww5GouF3zP1VAHQO3J5a+u+/1GSp8BMAEsaFP/DHIYd3?=
 =?us-ascii?Q?meqRc8akonkNv2v3E/yut6ZJ/FX6vbSy+UmfjUzrIe7/z8EIzlTfASAUW45t?=
 =?us-ascii?Q?5NORrhNy7VF0j0OzDZnEOBEDYvEckokimXC5eXUGMMwOJqjrYzGm/4I8naWw?=
 =?us-ascii?Q?zGnZr7LP0GEwwbD46aZ1tz9TAzVMyMyGS+YIOntwKqxcqOzgYgaPJz80GZTy?=
 =?us-ascii?Q?uMUY8SHbFF2w6dq9FirzD8cXg/HJrUKXVbW8jkVe4/cQIoh9XKdod8HKEY+2?=
 =?us-ascii?Q?NcFN0EDDwfSEuRAYaYpxuEexQkiindaxC+r/dAN6C+Ti4muG/NMX3mVY1B9x?=
 =?us-ascii?Q?INvTdTE2D7cSy5mP1eN841cDkfUUi+Iyr4Jp2UEz6LyTt/kh/Jrcxo3h6Nhm?=
 =?us-ascii?Q?BSRit6YlWYixjl/r3Xu+pMJAgOyWCZ73XQrO7/sxEAA1PmvrVctuErewigqD?=
 =?us-ascii?Q?HjlbvgniQ9K0n+F1FQ3acD95TqsVaNhTDAFtyPAoJ6IWAf6mqFZJs3IsunFw?=
 =?us-ascii?Q?I5WzjZTq2mVicFIT0AOxdpQ4IotK3BZMksi3odkbg4/ATYp1nWbmComVTCle?=
 =?us-ascii?Q?eDhyYPPxJezudSQVTVbX6A7XZtHDgRT3zgSFzH0CoJAtmWSedlm8f+84eTNI?=
 =?us-ascii?Q?ktLrQ0fi/XcUFunCY+2q5RcRFtUMGlCBJUkWxVddmwnA2HW5T2WBeFTErGbk?=
 =?us-ascii?Q?A9DsutYu6TgWOdntJTO661hb5DiS688kR6xH68xSXnJN33jYsbQ+NU6TXBF5?=
 =?us-ascii?Q?JsOxPKfXfw4S5XbKNCcfdqNkv57BV84VGDsANSQSZ6zrEw2t9mbW3Y5wZP7R?=
 =?us-ascii?Q?b/qa4KTwKi3r6P46PQNyQDJq0fFokD1eXkzNatc0E3FD/Ba5tZe5uIRxriyh?=
 =?us-ascii?Q?c8yRGoS3HXBTqk36RJpsIN1IYvkXLErXQr6acfmVUTf2lJxVbBUv1pFPX2K0?=
 =?us-ascii?Q?oHM35H/T4FxVYiEdSMNOqfM6Jvm90j0S6bBeLBGkNWvgQYnzv9wJyIqH6pEr?=
 =?us-ascii?Q?RYZOJrW4CQJ5ijVW8t/4Qg3O9mEk+5wVx1oCV7+jIJN2u7Q9Jo+vNLNs41fR?=
 =?us-ascii?Q?mQj5BeHYVvKjKYExjLIIXqa9YLz138p/OMFLx5ZwJlDrVGgcnEcKxFxBcUI3?=
 =?us-ascii?Q?ocCFV/its5qvSJmetlEF/lPVlbmfgghJBuIhA/dpgqn5f+SD1knoey136yzG?=
 =?us-ascii?Q?5ktnKvZCkitEMWdrvT+EmUds4dKpQ8r3cnjtuY9bZzU1uN7ax/FBWjdWstn1?=
 =?us-ascii?Q?QX6UjTgqnQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB09557853DD75C419B6748824D8629DF4PR8401MB0955_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f47bbe3-179c-4750-f6fa-08d9afd2ba17
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 05:16:24.8502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u6pPIpRN18tpbs3165IrmzbQCYxu2qkGWJs0xa8hz20A1wtk/0O7hKU51HUa2Fbvrvy3gbxqRMN+unkWbVIE+2KkhwmK6cLOE+2MNtkX8e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0507
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: kHzAyAWYdoTNEA-kFBkjv92MZgmD5Qk4
X-Proofpoint-ORIG-GUID: kHzAyAWYdoTNEA-kFBkjv92MZgmD5Qk4
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_03,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1011 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250030
X-Mailman-Approved-At: Mon, 29 Nov 2021 15:56:01 +1100
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

--_000_DF4PR8401MB09557853DD75C419B6748824D8629DF4PR8401MB0955_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have not been able to resolve this build error. I'll be grateful for any =
suggestions.

As an aside: how do I create an openbmc shell environment that is identical=
 to what the build uses? If I could do that, then I may be able to triage f=
urther.

Here are the details of the build failure...

$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.2 LTS
Release:        20.04
Codename:       focal

Building from a fresh clone:

git clone https://github.com/openbmc/openbmc.git
cd openbmc
. setup romulus
bitbake obmc-phosphor-image
:
Eventually an ERROR occurs
:
ERROR: phosphor-webui-1.0+gitAUTOINC+f59274e8ec-r1 do_compile: ExecutionErr=
or('/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-we=
bui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.255021', 1, None, None)
ERROR: Logfile of failure stored in: /sbox/user/openbmc/build/romulus/tmp/w=
ork/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/log.=
do_compile.255021

An error log is created under my ~/.npm directory (which seems like an odd =
location for it):

12516 error Error while executing:
12516 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h=
 -t https://github.com/novnc/noVNC.git
12516 error fatal: unable to access 'https://github.com/novnc/noVNC.git/': =
gnutls_handshake() failed: Access was denied

Though, I can successfully run that command from the shell.

Some google research suggests it could be related to the version of TLS tha=
t Git is using (https://stackoverflow.com/a/60292604/7010982) and that it n=
eeds TLS v1.2. However, it seems I'm using supported versions
(https://stackoverflow.com/a/53604947/7010982):

$ ldd $(which "$(git --exec-path)"/git-http-push) | grep gnutls
        libcurl-gnutls.so.4 =3D> /lib/x86_64-linux-gnu/libcurl-gnutls.so.4 =
(0x00007fdf47f21000)
        libgnutls.so.30 =3D> /lib/x86_64-linux-gnu/libgnutls.so.30 (0x00007=
fdf47933000)

$ curl --version
curl 7.68.0 (x86_64-pc-linux-gnu) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.11=
 brotli/1.0.7 libidn2/2.2.0 libpsl/0.21.0 (+libidn2/2.2.0) libssh/0.9.3/ope=
nssl/zlib nghttp2/1.40.0 librtmp/2.3
Release-Date: 2020-01-08
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 =
pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
Features: AsynchDNS brotli GSS-API HTTP2 HTTPS-proxy IDN IPv6 Kerberos Larg=
efile libz NTLM NTLM_WB PSL SPNEGO SSL TLS-SRP UnixSockets


Here's more of the log...
12510 verbose stack Error: exited with error code: 128
12510 verbose stack     at ChildProcess.<anonymous> (/sbox/user/openbmc/bui=
ld/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e=
8ec-r1/recipe-sysroot-native/usr/lib/node_modules/npm/node_modules/pacote/l=
ib/util/finished.js:12:19)
12510 verbose stack     at ChildProcess.emit (events.js:375:28)
12510 verbose stack     at maybeClose (internal/child_process.js:1055:16)
12510 verbose stack     at Socket.<anonymous> (internal/child_process.js:44=
1:11)
12510 verbose stack     at Socket.emit (events.js:375:28)
12510 verbose stack     at Pipe.<anonymous> (net.js:675:12)
12511 verbose cwd /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-lin=
ux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/git
12512 verbose Linux 5.4.0-84-generic
12513 verbose argv "/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-l=
inux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/recipe-sysroot-native/usr/=
bin/node" "/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phos=
phor-webui/1.0+gitAUTOINC+f59274e8ec-r1/recipe-sysroot-native/usr/bin/npm" =
"--loglevel" "info" "--proxy=3Dhttp://proxy:8080" "--https-proxy=3Dhttp://p=
roxy:8080" "install"
12514 verbose node v14.17.1
12515 verbose npm  v6.14.13
12516 error Error while executing:
12516 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h=
 -t https://github.com/novnc/noVNC.git
12516 error
12516 error fatal: unable to access 'https://github.com/novnc/noVNC.git/': =
gnutls_handshake() failed: Access was denied
12516 error
12516 error exited with error code: 128
12517 verbose exit [ 1, true ]




Contents of: log.do_compile.255021


DEBUG: Executing shell function do_compile
npm info it worked if it ends with ok
npm info using npm@6.14.13<mailto:npm@6.14.13>
npm info using node@v14.17.1<mailto:node@v14.17.1>
npm info lifecycle phosphor-webui@2.8.0-dev~preinstall<mailto:phosphor-webu=
i@2.8.0-dev~preinstall>: phosphor-webui@2.8.0-dev<mailto:phosphor-webui@2.8=
.0-dev>
npm timing stage:loadCurrentTree Completed in 41ms
npm timing stage:loadIdealTree:cloneCurrentTree Completed in 1ms
npm timing stage:loadIdealTree:loadShrinkwrap Completed in 1275ms
npm timing stage:loadIdealTree:loadAllDepsIntoIdealTree Completed in 3285ms
npm timing stage:loadIdealTree Completed in 5545ms
npm timing stage:generateActionsToTake Completed in 1045ms
npm timing audit submit Completed in 1366ms
npm http fetch POST 200 https://registry.npmjs.org/-/npm/v1/security/audits=
/quick 1766ms
npm timing audit body Completed in 411ms
npm timing action:extract Completed in 2048ms
npm WARN tar ENOENT: no such file or directory, open '/sbox/user/openbmc/bu=
ild/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274=
e8ec-r1/git/node_modules/.staging/pump-64d8e380/package.json'
npm WARN tar ENOENT: no such file or directory, open '/sbox/user/openbmc/bu=
ild/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274=
e8ec-r1/git/node_modules/.staging/os-locale-6fd88320/package.json
:
Lots of lines similar to the previous
:
npm timing stage:rollbackFailedOptional Completed in 1ms
npm timing stage:runTopLevelLifecycles Completed in 13501ms
npm ERR! Error while executing:
npm ERR! /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h -t=
 https://github.com/novnc/noVNC.git
npm ERR!
npm ERR! fatal: unable to access 'https://github.com/novnc/noVNC.git/': gnu=
tls_handshake() failed: Access was denied
npm ERR!
npm ERR! exited with error code: 128
npm timing npm Completed in 15630ms

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/user/.npm/_logs/2021-11-25T03_04_36_251Z-debug.log
WARNING: /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosph=
or-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.3665580:143 exit =
1 from 'npm --loglevel info --proxy=3Dhttp://proxy:8080 --https-proxy=3Dhtt=
p://proxy:8080 install'
WARNING: Backtrace (BB generated script):
                #1: do_compile, /sbox/user/openbmc/build/romulus/tmp/work/a=
ll-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_co=
mpile.3665580, line 143
                #2: main, /sbox/user/openbmc/build/romulus/tmp/work/all-ope=
nbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.=
3665580, line 148

--_000_DF4PR8401MB09557853DD75C419B6748824D8629DF4PR8401MB0955_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-AU" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I have not been able to resolve=
 this build error. I&#8217;ll be grateful for any suggestions.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">As an aside: how do I create an=
 openbmc shell environment that is identical to what the build uses? If I c=
ould do that, then I may be able to triage further.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Here are the details of the bui=
ld failure&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">$ lsb_release -a<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">No LSB modules are available.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Distributor ID: Ubuntu<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Description:&nbsp;&nbsp;&nbsp; =
Ubuntu 20.04.2 LTS<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Release:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 20.04<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Codename:&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; focal<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Building from a fresh clone:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">git clone <a href=3D"https://gi=
thub.com/openbmc/openbmc.git">
https://github.com/openbmc/openbmc.git</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">cd openbmc<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">. setup romulus<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">bitbake obmc-phosphor-image<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Eventually an ERROR occurs<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">ERROR: phosphor-webui-1.0+gitAU=
TOINC+f59274e8ec-r1 do_compile: ExecutionError('/sbox/user/openbmc/build/ro=
mulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r=
1/temp/run.do_compile.255021', 1, None,
 None)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">ERROR: Logfile of failure store=
d in: /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-=
webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/log.do_compile.255021<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">An error log is created under m=
y ~/.npm directory (which seems like an odd location for it):<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error </span><b><span style=3D"font-size:10.5pt;font-family:Consolas;color=
:#CE9178;mso-fareast-language:EN-AU">Error</span></b><span style=3D"font-si=
ze:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"> w=
hile executing:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h -t <=
/span>
<span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fare=
ast-language:EN-AU"><a href=3D"https://github.com/novnc/noVNC.git">https://=
github.com/novnc/noVNC.git</a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error fatal: unable to access </span><span style=3D"font-size:10.5pt;font-=
family:Consolas;color:#CE9178;mso-fareast-language:EN-AU">'https://github.c=
om/novnc/noVNC.git/'</span><span style=3D"font-size:10.5pt;font-family:Cons=
olas;color:#D4D4D4;mso-fareast-language:EN-AU">:
 gnutls_handshake() failed: Access was denied<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Though, I can successfully run =
that command from the shell.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Some google research suggests i=
t could be related to the version of TLS that Git is using (<a href=3D"http=
s://stackoverflow.com/a/60292604/7010982">https://stackoverflow.com/a/60292=
604/7010982</a>) and that it needs TLS
 v1.2. However, it seems I&#8217;m using supported versions<br>
(<a href=3D"https://stackoverflow.com/a/53604947/7010982">https://stackover=
flow.com/a/53604947/7010982</a>):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">$ ldd $(which &quot;$(git --exe=
c-path)&quot;/git-http-push) | grep gnutls<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libcurl-gnutls.so.4 =3D&gt; /lib/x86_64-linux-gnu/libcurl-gnutl=
s.so.4 (0x00007fdf47f21000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; libgnutls.so.30 =3D&gt; /lib/x86_64-linux-gnu/libgnutls.so.30 (=
0x00007fdf47933000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><br>
$ curl --version<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">curl 7.68.0 (x86_64-pc-linux-gn=
u) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.11 brotli/1.0.7 libidn2/2.2.0 lib=
psl/0.21.0 (+libidn2/2.2.0) libssh/0.9.3/openssl/zlib nghttp2/1.40.0 librtm=
p/2.3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Release-Date: 2020-01-08<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Protocols: dict file ftp ftps g=
opher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp scp sftp smb sm=
bs smtp smtps telnet tftp
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Features: AsynchDNS brotli GSS-=
API HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB PSL SPN=
EGO SSL TLS-SRP UnixSockets<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Here&#8217;s more of the log&#8=
230;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack </span><b><span style=3D"font-size:10.5pt;font-family:Consol=
as;color:#CE9178;mso-fareast-language:EN-AU">Error</span></b><span style=3D=
"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:E=
N-AU">: exited with error code:
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;m=
so-fareast-language:EN-AU">128</span><span style=3D"font-size:10.5pt;font-f=
amily:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at ChildProcess.&lt;anonymous&gt; (/sbox/user/=
openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-webui/</span><spa=
n style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-=
language:EN-AU">1</span><span style=3D"font-size:10.5pt;font-family:Consola=
s;color:#D4D4D4;mso-fareast-language:EN-AU">.</span><span style=3D"font-siz=
e:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">0</=
span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso=
-fareast-language:EN-AU">+gitAUTOINC+</span><span style=3D"font-size:10.5pt=
;font-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">f59274e8ec<=
/span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;ms=
o-fareast-language:EN-AU">-r1/recipe-sysroot-native/usr/lib/node_modules/np=
m/node_modules/pacote/lib/util/finished.js:</span><span style=3D"font-size:=
10.5pt;font-family:Consolas;color:#6A9955;mso-fareast-language:EN-AU">12:19=
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;m=
so-fareast-language:EN-AU">)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at </span><span style=3D"font-size:10.5pt;font=
-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">ChildProcess.emi=
t</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;=
mso-fareast-language:EN-AU"> (</span><span style=3D"font-size:10.5pt;font-f=
amily:Consolas;color:#569CD6;mso-fareast-language:EN-AU">events.js</span><s=
pan style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareas=
t-language:EN-AU">:</span><span style=3D"font-size:10.5pt;font-family:Conso=
las;color:#569CD6;mso-fareast-language:EN-AU">375:28</span><span style=3D"f=
ont-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-=
AU">)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at maybeClose (internal/child_process.js:</spa=
n><span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fa=
reast-language:EN-AU">1055:16</span><span style=3D"font-size:10.5pt;font-fa=
mily:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at Socket.&lt;anonymous&gt; (internal/child_pr=
ocess.js:</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:=
#569CD6;mso-fareast-language:EN-AU">441:11</span><span style=3D"font-size:1=
0.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">)<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at </span><span style=3D"font-size:10.5pt;font=
-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">Socket.emit</spa=
n><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fa=
reast-language:EN-AU"> (</span><span style=3D"font-size:10.5pt;font-family:=
Consolas;color:#569CD6;mso-fareast-language:EN-AU">events.js</span><span st=
yle=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-lang=
uage:EN-AU">:</span><span style=3D"font-size:10.5pt;font-family:Consolas;co=
lor:#569CD6;mso-fareast-language:EN-AU">375:28</span><span style=3D"font-si=
ze:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">)<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12510</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose stack &nbsp; &nbsp; at Pipe.&lt;anonymous&gt; (</span><span style=
=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-languag=
e:EN-AU">net.js</span><span style=3D"font-size:10.5pt;font-family:Consolas;=
color:#D4D4D4;mso-fareast-language:EN-AU">:</span><span style=3D"font-size:=
10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">675:1=
2</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;=
mso-fareast-language:EN-AU">)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12511</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose cwd /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/ph=
osphor-webui/</span><span style=3D"font-size:10.5pt;font-family:Consolas;co=
lor:#569CD6;mso-fareast-language:EN-AU">1</span><span style=3D"font-size:10=
.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">.</span=
><span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-far=
east-language:EN-AU">0</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">+gitAUTOINC+</span><span s=
tyle=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-lan=
guage:EN-AU">f59274e8ec</span><span style=3D"font-size:10.5pt;font-family:C=
onsolas;color:#D4D4D4;mso-fareast-language:EN-AU">-r1/git<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12512</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose Linux </span><span style=3D"font-size:10.5pt;font-family:Consolas;=
color:#569CD6;mso-fareast-language:EN-AU">5</span><span style=3D"font-size:=
10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">.</sp=
an><span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-f=
areast-language:EN-AU">4</span><span style=3D"font-size:10.5pt;font-family:=
Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">.</span><span style=3D"f=
ont-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast-language:EN-=
AU">0</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D=
4D4;mso-fareast-language:EN-AU">-</span><span style=3D"font-size:10.5pt;fon=
t-family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">84</span><span =
style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-la=
nguage:EN-AU">-generic<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12513</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose argv </span><span style=3D"font-size:10.5pt;font-family:Consolas;c=
olor:#CE9178;mso-fareast-language:EN-AU">&quot;/sbox/user/openbmc/build/rom=
ulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1=
/recipe-sysroot-native/usr/bin/node&quot;</span><span style=3D"font-size:10=
.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;/sbox/user/openbmc/build/romulus/tmp/work/=
all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/recipe-sysroo=
t-native/usr/bin/npm&quot;</span><span style=3D"font-size:10.5pt;font-famil=
y:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;--loglevel&quot;</span><span style=3D"font=
-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"=
>
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;info&quot;</span><span style=3D"font-size:=
10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;--proxy=3Dhttp://proxy:8080&quot;</span><s=
pan style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareas=
t-language:EN-AU">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;--https-proxy=3Dhttp://proxy:8080&quot;</s=
pan><span style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-=
fareast-language:EN-AU">
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#CE9178;m=
so-fareast-language:EN-AU">&quot;install&quot;</span><span style=3D"font-si=
ze:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12514</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose node </span><span style=3D"font-size:10.5pt;font-family:Consolas;c=
olor:#569CD6;mso-fareast-language:EN-AU">v14.17.1</span><span style=3D"font=
-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12515</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose npm &nbsp;</span><span style=3D"font-size:10.5pt;font-family:Conso=
las;color:#569CD6;mso-fareast-language:EN-AU">v6.14.13</span><span style=3D=
"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:E=
N-AU"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error </span><b><span style=3D"font-size:10.5pt;font-family:Consolas;color=
:#CE9178;mso-fareast-language:EN-AU">Error</span></b><span style=3D"font-si=
ze:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"> w=
hile executing:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h -t <=
/span>
<span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fare=
ast-language:EN-AU"><a href=3D"https://github.com/novnc/noVNC.git">https://=
github.com/novnc/noVNC.git</a></span><span style=3D"font-size:10.5pt;font-f=
amily:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error fatal: unable to access </span><span style=3D"font-size:10.5pt;font-=
family:Consolas;color:#CE9178;mso-fareast-language:EN-AU">'https://github.c=
om/novnc/noVNC.git/'</span><span style=3D"font-size:10.5pt;font-family:Cons=
olas;color:#D4D4D4;mso-fareast-language:EN-AU">:
 gnutls_handshake() failed: Access was denied<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12516</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 error exited with error code: </span><span style=3D"font-size:10.5pt;font-=
family:Consolas;color:#569CD6;mso-fareast-language:EN-AU">128</span><span s=
tyle=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-lan=
guage:EN-AU"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;mso-fareast=
-language:EN-AU">12517</span><span style=3D"font-size:10.5pt;font-family:Co=
nsolas;color:#D4D4D4;mso-fareast-language:EN-AU">
 verbose exit [ </span><span style=3D"font-size:10.5pt;font-family:Consolas=
;color:#569CD6;mso-fareast-language:EN-AU">1</span><span style=3D"font-size=
:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU">,
</span><span style=3D"font-size:10.5pt;font-family:Consolas;color:#569CD6;m=
so-fareast-language:EN-AU">true</span><span style=3D"font-size:10.5pt;font-=
family:Consolas;color:#D4D4D4;mso-fareast-language:EN-AU"> ]<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"line-height:14.25pt;background:#1E1E1E"><sp=
an style=3D"font-size:10.5pt;font-family:Consolas;color:#D4D4D4;mso-fareast=
-language:EN-AU"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Contents of: log.do_compile.255=
021<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">DEBUG: Executing shell function=
 do_compile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm info it worked if it ends w=
ith ok<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm info using <a href=3D"mailt=
o:npm@6.14.13">
npm@6.14.13</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm info using <a href=3D"mailt=
o:node@v14.17.1">
node@v14.17.1</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm info lifecycle <a href=3D"m=
ailto:phosphor-webui@2.8.0-dev~preinstall">
phosphor-webui@2.8.0-dev~preinstall</a>: <a href=3D"mailto:phosphor-webui@2=
.8.0-dev">
phosphor-webui@2.8.0-dev</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:loadCurrentTre=
e Completed in 41ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:loadIdealTree:=
cloneCurrentTree Completed in 1ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:loadIdealTree:=
loadShrinkwrap Completed in 1275ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:loadIdealTree:=
loadAllDepsIntoIdealTree Completed in 3285ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:loadIdealTree =
Completed in 5545ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:generateAction=
sToTake Completed in 1045ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing audit submit Complet=
ed in 1366ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm http fetch POST 200 <a href=
=3D"https://registry.npmjs.org/-/npm/v1/security/audits/quick">
https://registry.npmjs.org/-/npm/v1/security/audits/quick</a> 1766ms<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing audit body Completed=
 in 411ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing action:extract Compl=
eted in 2048ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm WARN tar ENOENT: no such fi=
le or directory, open '/sbox/user/openbmc/build/romulus/tmp/work/all-openbm=
c-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/git/node_modules/.stagi=
ng/pump-64d8e380/package.json'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm WARN tar ENOENT: no such fi=
le or directory, open '/sbox/user/openbmc/build/romulus/tmp/work/all-openbm=
c-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/git/node_modules/.stagi=
ng/os-locale-6fd88320/package.json<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Lots of lines similar to the pr=
evious<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:rollbackFailed=
Optional Completed in 1ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing stage:runTopLevelLif=
ecycles Completed in 13501ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! Error while executing:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! /sbox/user/openbmc/bui=
ld/romulus/tmp/hosttools/git ls-remote -h -t
<a href=3D"https://github.com/novnc/noVNC.git">https://github.com/novnc/noV=
NC.git</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! fatal: unable to acces=
s 'https://github.com/novnc/noVNC.git/': gnutls_handshake() failed: Access =
was denied<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! exited with error code=
: 128<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm timing npm Completed in 156=
30ms<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR! A complete log of this=
 run can be found in:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">npm ERR!&nbsp;&nbsp;&nbsp;&nbsp=
; /home/user/.npm/_logs/2021-11-25T03_04_36_251Z-debug.log<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">WARNING: /sbox/user/openbmc/bui=
ld/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e=
8ec-r1/temp/run.do_compile.3665580:143 exit 1 from 'npm --loglevel info --p=
roxy=3Dhttp://proxy:8080 --https-proxy=3Dhttp://proxy:8080
 install'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">WARNING: Backtrace (BB generate=
d script):
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #1: do_compile,=
 /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-webui=
/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.3665580, line 143<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #2: main, /sbox=
/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+g=
itAUTOINC+f59274e8ec-r1/temp/run.do_compile.3665580, line 148<o:p></o:p></s=
pan></p>
</div>
</body>
</html>

--_000_DF4PR8401MB09557853DD75C419B6748824D8629DF4PR8401MB0955_--
