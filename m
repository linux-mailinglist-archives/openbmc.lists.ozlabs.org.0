Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8122B085
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 15:31:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCCsQ1VLNzDrQM
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 23:31:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0473587565=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 1800 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Jul 2020 23:30:02 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCCqt0q7bzDqN8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 23:30:00 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NCwS6D017866; Thu, 23 Jul 2020 12:59:54 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com with ESMTP id 32f75qswpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 12:59:53 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 81C819D;
 Thu, 23 Jul 2020 12:59:53 +0000 (UTC)
Received: from G4W10204.americas.hpqcorp.net (16.207.82.16) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Jul 2020 12:59:52 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.241.52.13) by
 G4W10204.americas.hpqcorp.net (16.207.82.16) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 23 Jul 2020 12:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYEb8nZ/hr+pIweUGE2nejJpY+qu2dLhaGFGaUl2l+k2bPE1t25L3sm5NfafG+lOsDgJ0xwkUIsQ79QfIkyfP9ILD00hWmxUOz0eui0EvU1zMrO+IfXulWtLHhjm8XmZKo/KuMgkWmGyxJLWxhu0w+a46xS7DeTGFLl5047tTJHFIgdLpZj1/xMIF+71UVzbiur4iflulwhVbTNPFt1WS11hfSl8hDHiby2FMvmo8m2gv+eh9l0qr86O7j34w0ntVvw+wmV/JSgP7qka8YaAXIxEQj5+FTgZ4QE0OzIGOLT9O5j05Hl4BgwNJVvys/d7mvbi/JChmexQKBOM99UbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRZ3G/Ak+gdbRIWKWJi06r4ayS18gzPvQucyM73LF48=;
 b=lP4TJf5fl9YHRO63RQ+Jov6sXgki52UlePLDMLLys84MmaucHBVGgh7Jy8BngJ2Z2qKXm67wdZwigK1EFqMDYFr7FyzNlGmiJiarlxDu5QG/8LYpGnSSrxc+dtIWjztIA4lPCeJNzHsRUzbXm00FUhjnHn2Vhzhavs3YypW1anzFm3+p/r6uZ5Oli9y7413hKzQ9OoThgFmWStlqryWRSfdLRs/+VRUPbWZU2aY5MffrIYxsqXeFfksT9q7lZDbhw0AvQc8um/EN+DBDz3q7BJ0ecAW5g6vvf/W19iJBCJ19JtOMEV3l9kJ0n0Ru8oJ2Fe/J/6B/Ra/mKZWagNDszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB0949.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 12:59:52 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 12:59:51 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Subject: RE: Question about OpenBMC Remote BIOS configuration proposal
Thread-Topic: Question about OpenBMC Remote BIOS configuration proposal
Thread-Index: AdZgyrFMz0kBQ4JpRYCZI6XSJUYpdAAB/0kAAAVhxTA=
Date: Thu, 23 Jul 2020 12:59:51 +0000
Message-ID: <CS1PR8401MB11443999B40B22F4B97689EEFF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
In-Reply-To: <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none; linux.vnet.ibm.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [1.34.113.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9164b147-ce12-4dfd-d2b3-08d82f0849e8
x-ms-traffictypediagnostic: CS1PR8401MB0949:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CS1PR8401MB0949B93A44CE1DDFECAE7190FF760@CS1PR8401MB0949.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nWxRHXjQDLbIg33c3czZFABtanPGs6pznXUZyxCarLBnTcO5bwYQPPG0TCbBO74mI3jJ+yJ+F86aw8Tppg5Co6de86P6ywdJZ2Uv1aYo3k+H/24eeP3xBDtJHaL+5XWl9VDAGp+fUitLdy9ESh90nJt8FGmbKp2cSFcnrpvmEhD2lls1VS5CEyDUtwLpKo07t7Z1EShE6oQJjGBb7Nnc9k6WQkqfFLgw1NrNKlVTgGmg6iRFCXafuE0fZ+1ZAdabhkATEFz9kYBtRdsFy30Ci2Nkm707KoiB+xAOteGVc1F7CTn9Lyk/EQyUMR9ojfpd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(346002)(396003)(136003)(39860400002)(8936002)(478600001)(33656002)(8676002)(4326008)(2906002)(83380400001)(55016002)(6506007)(86362001)(71200400001)(7696005)(53546011)(66446008)(316002)(76116006)(54906003)(64756008)(66556008)(66476007)(26005)(66946007)(5660300002)(52536014)(110136005)(186003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: oxdBZxgc1w8GUX4/54F7Rh5WUgcRHekdzQX+qXnC2cuoS9oy99a/st3hvFPsz9SLQxSMhNETbozjUaVsfKt6UAWaxmHQJZfXdt5ltZBNhTWpS9ceFj0LxJfUj7srmSca3Eealks1HXjXhazW5ytc3HQia9A2Wh+XN4M5QUxqrqM3qggQx2w0Ihj1JIZSON48HZkEaTBywfpO9EEykS//FzsJOtKm67cub/ZIt+d8ATdSjqiXM6b9IPk6pLA9VcCgROzS9R9TIqUnHvTf/ZLwtOqK8BPZlsIDRuudb/z+60xDXzWKNSS1YtI0Mo+0Rqv3LdidCb4dYQcivFKxNcbIu8M3oG3UUQ9q5/rajN9Xg7r/zcaiteTbfVeDNDHNLjJvonUJr+zG5UdlY2zesFLhxGb1CljfwCR+zRiVqDhevZwKyGF3ZXhGU8HDcPp9EFTeaY1aRq0DvYXTi8fO0JApW9+5gi0pGYUDxf1LBJ0w5mQ=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9164b147-ce12-4dfd-d2b3-08d82f0849e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 12:59:51.6885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZEBoEZQJOhCBoqv7O/smVBF6NU3xFaZZahSzLPq97ZTcn+XbEf5VJ2XZsLXzpExn/zKEzvJl/+5Fr0krOrDwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0949
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_05:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230097
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu, Frank \(ISS
 Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the information Deepak,

I am afraid that once some code is contributed to the open source, then tha=
t code could become the standard implementation and used by BMC vendors. To=
 support PLDM or other protocols between BIOS<->BMC result in the different=
 implementations from BMC view point. Shall we standardize the spec and the=
 implementation as well? If we would like to give the flexibility to suppor=
t BIOS <-> BMC protocols for the remote BIOS configurations, shall we abstr=
act some layers based on Remote BIOS configuration proposal? Thus OpenBMC c=
an provide the generic (the base implementation) code for BIOS <-> BMC prot=
ocol and OEM provides the implementation of abstract driver/library?

Abner

> -----Original Message-----
> From: Deepak Kodihalli [mailto:dkodihal@linux.vnet.ibm.com]
> Sent: Thursday, July 23, 2020 5:22 PM
> To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>;
> suryakanth.sekar@linux.intel.com
> Cc: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>;
> openbmc@lists.ozlabs.org; Wu, Frank (ISS Firmware) <frank.l.wu@hpe.com>
> Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
>=20
> On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
> > Hi Sekar,
> > This is Abner Chang from HPE Server BIOS team, our team is also
> > working on UEFI/EDK2 Redfish open source solution (just FYI the POC
> > code is almost done).
> >
> > I read through the Remote BIOS configuration proposal and would like
> > to see if we still have chance to make some changes on it to reduce
> > the efforts on both BMC and BIOS. Also get rid of using PLDM BIOS
> > control/Configuration methodology because we can find the equivalent
> > method if use Redfish service.
>=20
> The design describes PLDM as one of the alternatives, but it is not the o=
nly.
> The design talks about inband IPMI as well. In other words, the design
> doesn't mandate what inband communication protocol BIOS and BMC should
> use. On certain IBM systems, this protocol is PLDM.
>=20
> Regards,
> Deepak

