Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3322F15C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 16:31:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFj1K5S6VzF1Lb
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 00:31:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0477dec11c=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFhyH5zKrzDrqg
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 00:29:08 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RE879d017145; Mon, 27 Jul 2020 14:29:01 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 32gcrkpjt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 14:29:01 +0000
Received: from G2W6311.americas.hpqcorp.net (g2w6311.austin.hp.com
 [16.197.64.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id EB57374;
 Mon, 27 Jul 2020 14:28:59 +0000 (UTC)
Received: from G4W9329.americas.hpqcorp.net (16.208.32.99) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 14:28:59 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G4W9329.americas.hpqcorp.net (2002:10d0:2063::10d0:2063) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 27 Jul 2020 14:28:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 27 Jul 2020 14:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTBoNBMJV3yTtqv2jrbXvKAhMDB9AJ5QjoP7XJUYZV8s+mtg9nvZLODn6joZTIQO7TYEgx1hpUOm4dQRyLrLufBpaaV2zTEwkO375f+oxluyD9dsUOIlZnCdeeg0ve3TIrZlovXVgLyVc8bQrJ0Z9MswQqzGykOaa5IVFdC9jUw8OjC+J+sbC14W0QWTpjenqXlrJpXhBleDoircR4nOpl8hpi4OuMzsVev9H1eL96qtbLIxJn+HKg7CS3sZs+d/Du4YZX70eTNCxLOSna4RDjemXzOz+GmGHMGbG1pGrKCpFbid687qFrzAUGcf3Od3UY1tpKimmrWWcwdRoByfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK1vkURbezj0NI8/Z1Sw4iQPHzo8L7kZaGqOGUikA1E=;
 b=DZAZjZkHQ13GQOKgXqm6zapRcJJ1hPScDESk96ung0Nx+dKiMOA6pxdFM/vd61+dBBtxzgdJhlcWbW46vYcAyBsPy2qzqGcf3dgxSHJHF2dRImJ6HjLp+T1IGR/Q1tj5EDEqpbKzlr29AZTMZXCuROKDBUeRzE2OYkrrERoI90fjDOQwQnSIBeNady/biiadP8BKv0W0kX/H3kyr7C2Jy01b8r8Jb66WTSlQVvxvoX1bHBkXdMVbSfUtk+SxL5l6e93bzaoxp1NqX9iChWws9zaQ8BGEZfXyqqwOUynJUnee5C/NVcfWXwj+/1nCSvaJVZhGA1lxWwwj4BOtl6w3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB1240.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 14:28:56 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 14:28:55 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Topic: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Index: AdZiNn5KWJT9vXnOQm2LeRMxyQeKbAA6almAAABWi2AAP/i1AAAAIHKA
Date: Mon, 27 Jul 2020 14:28:55 +0000
Message-ID: <CS1PR8401MB114436131D6F5D75A62163ADFF720@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
 <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <20200727142244.GM3922@heinlein>
In-Reply-To: <20200727142244.GM3922@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [16.242.247.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 23ac8ac8-8cac-444f-7616-08d8323964e0
x-ms-traffictypediagnostic: CS1PR8401MB1240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CS1PR8401MB1240BDF00AEC5FAC337ED473FF720@CS1PR8401MB1240.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EjSFhPklSOviUZreEgg79cT6BpbKwRPHmzwtFG6UnOi9fNhUL+EWmDqqekyKy1BnBQJ6eUftFoTleQTQD7JmLMpn+d7hpaMBiTtXlN71svDHublasyivt+27Frp2jgDxp0iiVem4Wpzk/A1AWg+tLJGaVtmVPPUsKVSAXlhTFMP3NYM8EqU6wkuYy7bdbDE0vKqb8gjG3SPkj8fjr4m/p9ycrnYM0u85IyEefg8TB0+SO/cdHsPOa2Q8CxXJHe3cuGZFMD854ziwd2mfTbfcS0avE0caw+0AkiYAqY3V1E2Ti/3slawMTL1QjM5OJYAccvj41DypvF9Kf75CMyxCEzXuqNR7bXVtvIVMdbBxbKvts2jLDebKQIHnDo7QnFRsTafCkq9gSDwp8rWCdlc4xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(366004)(396003)(376002)(136003)(52536014)(76116006)(478600001)(966005)(66946007)(6916009)(54906003)(86362001)(316002)(5660300002)(26005)(9686003)(186003)(2906002)(55016002)(33656002)(83380400001)(8676002)(66476007)(64756008)(6506007)(66446008)(66556008)(53546011)(8936002)(4326008)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZlKWNwz5BAuepdyOBrNrCT8DD1BTwK+vx1pElzunSYvv37Y2ii37FuY8aWOizLixj5uMbntkw/xDTQTFKajNmQqtRXSoOO5UQXOg8nLLwLFJCALfZzO1pI4s9qxrUYtoQfdj1wHCYuSrkuQHD0KGfJ+im4hClUgdgYpc3q2Qba8mgCclzwnRAODWWGYq8sk+TZyyB4lcFd2moljGbnadSeStv/BVoKrN9FfjPWGSVIBXXL9qR/HU2TujC/yAEz6MNvroPEWm4ZzqIrPObIdvdmaUk5OX0z6RlWv86Bd+IMVmdHuLKcN6KdFDWbkoy7AsuN2/sYfBtg7t3C0xXXmKjn76au/9Zr8hBMgIfh8GZrjtzVAt7qxATWx6wCgicE6ZNz/BilXSSTDZE3MuT6NtRnpwK+eRMfkQBUIHNvhJFhKoBkZqhgbeqRbgHm25NWJcS7CbDHOBeF54NHbMxCirpzslzLp/78p667vgLSkYlreYawej0cUBRI3Jq0fQjzC3
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ac8ac8-8cac-444f-7616-08d8323964e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 14:28:55.8812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkUNje9pTiQHvk5FcrWGMB42ElE1qnP7AjQ/J5dx6IG+GD1XSyyij0IcvNH2g1wgfLgkWFgdaP1KbR3fSOX8rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB1240
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_08:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=965 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270103
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Garrett,
 Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Patrick Williams [mailto:patrick@stwcx.xyz]
> Sent: Monday, July 27, 2020 10:23 PM
> To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
> Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>;
> suryakanth.sekar@linux.intel.com; Brad Bishop
> <bradleyb@fuzziesquirrel.com>; Patrick Williams <patrick@stwcx.xyz>;
> openbmc@lists.ozlabs.org; Garrett, Mike (HPE Server Firmware)
> <mike.garrett@hpe.com>
> Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc
>=20
> On Sun, Jul 26, 2020 at 07:55:03AM +0000, Chang, Abner (HPS SW/FW
> Technologist) wrote:
> > Hi Deepak, thanks for the reminder. Miller also mentioned this to me. N=
ow
> I am follow the steps mentioned in Contributions.md to activate me accoun=
t.
> I just signed OpenBMC ICLA and sent back to OpenBMC for the approval.
> > Thanks
> > Abner
>=20
> Hi Abner,
>=20
> I think since you are working at HPE, the best solution here is to get you
> added to the HPE CCLA [1] rather than have you sign an individual one.  T=
his
> gives us higher confidence that you are cleared for contribution by your
> company's internal processes as well.
>=20
> Scott Shaffer and Mike Garrett are the two listed in the CCLA which can
> update and add your name to the list.
>=20
> [1] https://drive.google.com/drive/folders/1VOKT6mnBX1UjMQqKcC75-
> ir8GcLU1YE1
>=20
> (cc'ing Mike)

Ok, I am not aware of this because I don't work on BMC code. I will contact=
 with Mike off line for this.
Thanks
Abner

>=20
> --
> Patrick Williams
