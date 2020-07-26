Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A987222DD11
	for <lists+openbmc@lfdr.de>; Sun, 26 Jul 2020 09:56:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDwHG0zhczF12Y
	for <lists+openbmc@lfdr.de>; Sun, 26 Jul 2020 17:56:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0476dd2c0b=abner.chang@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDwGH6s2fzF0x4
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2020 17:55:14 +1000 (AEST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06Q7mmWf031609; Sun, 26 Jul 2020 07:55:07 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0a-002e3701.pphosted.com with ESMTP id 32gcq2dn4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 07:55:07 +0000
Received: from G9W8453.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.216.160.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 3FBB96F;
 Sun, 26 Jul 2020 07:55:06 +0000 (UTC)
Received: from G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) by
 G9W8453.americas.hpqcorp.net (2002:10d8:a0d3::10d8:a0d3) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sun, 26 Jul 2020 07:55:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W9119.americas.hpqcorp.net (16.210.20.214) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sun, 26 Jul 2020 07:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0atzb26sFvw1WoNh6gWFKMTLVQjBa5zNACe4eLiRFSmcOl5rfIIG4IptYMPKllHUpFdDr8rYZ1Tst58BDeyZPqDPaGEmICAOx35fnVtmPnoPcg0M3scZkjGcrNirY3Y4uS9f4k3rgGrCVjpH0i76kN+9j4jo0VS8TGA+N7+JFC8gG/+zP7xKjeZV5D3JcuBGblUA9yhnoeZuCTfVnbPkppUHcBJsjwoBW1hmWA3YnGmaDOWR8uFEg/85Tw0FWHH0WdpRmJX8FLIuJrRWwViQyqYu8u/0YutJjCMv/ZWYdAURtlnmXTc++PIfHBwcE3PoggyADTBe+RbsiRo7pPBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGBfoUp5DwpX6wJw69iSlmcDgyGMuvf030cE1Anf7Q4=;
 b=M3dRci7WaEkIdFWjMbKugRdNh/iRc0adLvs76KPcvQ1zFgTefq0jBXDbmDCtaXd2boAeY7xL/DsVaSp87mWBk2okcGy7b2StNgPw39bPYY5upQLIG8paa0XcaXfdyu5ZHnx8tK87kF+eT9mGe5lTceuwof2PdUvth/glJPls7sxsLDXJLuLSJFZi8CWjam/wELdcWsPvpeCCepaLJs69h+R2b1/qts0Z67cqaKWsy4SmZB2pBENOWiZSUiIr7u7lP9dXWfBSgtmllmg5vGJbV7AQgwaYalozgJX+KP4nXMbN5GOfDalkIBdeUDyatFllsXl5cKtjpc9403WRoaH9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7508::16) by CS1PR8401MB1047.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7512::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Sun, 26 Jul
 2020 07:55:03 +0000
Received: from CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5]) by CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::58f4:cfb4:beb0:f5d5%7]) with mapi id 15.20.3216.031; Sun, 26 Jul 2020
 07:55:03 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Topic: Fix content rendering issue on RemoteBiosConfiguration doc
Thread-Index: AdZiNn5KWJT9vXnOQm2LeRMxyQeKbAA6almAAABWi2A=
Date: Sun, 26 Jul 2020 07:55:03 +0000
Message-ID: <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
In-Reply-To: <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none; linux.vnet.ibm.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [1.34.113.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 588b1b25-0db6-437f-fd0e-08d831393488
x-ms-traffictypediagnostic: CS1PR8401MB1047:
x-microsoft-antispam-prvs: <CS1PR8401MB10471ED350843F90D5DF6945FF750@CS1PR8401MB1047.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B+KMP5AbBcK2rWhNA2HySo2gFvURqgyr/EZA8JismRO/b52SS58u7CqfTv7FLhdbfp7MBzXE6ngufac+YxxTosYgxqfbbJFmNrK3EHCuuW6tLAzWZRjao1gvOYkDHsSb0TiaQH4U5rOMfPZsvcp1AK+YBQVMY8KxvlSt7B+vWehHyrmm1nKUC6nHizBQIFqtG0N6ibfbBwRSTv845vc/OmzWTPLpfoG1VjWfqW+vYnqy/1LcbxVe38EQJvsBJxCFLyQAVew55bkr7zIHy+wfJpl/k9HMEzBu0RqAh2wOkY/yw4QpiEVDWHkqJv+r9pBT2I197OWY7x7As7eOUoNbZ03aq+1Kg7bHdXv3NBpK1Ai44augslU9KNAnEPvhUWQhNI8U57SFP7C9X3+y0A2uxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(52536014)(7696005)(110136005)(6506007)(2906002)(316002)(5660300002)(8936002)(8676002)(86362001)(66946007)(66446008)(64756008)(66556008)(66476007)(76116006)(478600001)(33656002)(55016002)(9686003)(26005)(186003)(966005)(71200400001)(53546011)(4326008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aOvTF5e1x/a2k49ED5ZuTvH/RJIYDvZoVPztD8obwUREkS414FiC4BaQsy7OwxQ1v6J+YLgdNxwga1bNlRmFYFx2lSGVfO9ug4EwlvCtE6+bAZSUm3GbMK3GPxAoYR+bSnmyyawHHPLedHBdSK9TihyW+idlPuc7bzF0tmM8fGpsbBcpqCkrkj9bBXNK2lFydZJcrsXyYT1+cEAHr0FE1uCuqULhQwIlmNjyflm5oWHwnUgM+cFSoC/lx743lvDs9FdD2PAPopkw5nu33dpu/5/nMn1e4XvmEdsab18KDAkVVBkOTRPLFPdUqUukgpnz1gWxrBRYVoYAltre77J1K6Fw+Qzx+9xAKfj7+fHsAD7+XH+fOS798BsoIWIZ6tafEJIuREJNcFqib71X+/ub6/ftz4GSkWZ0bK6LgzVufolXdNKbYwbQR+lRFLgAuc4PdZKtNkL3EaSp/V/PcJaG8n0BOM085F9pvMEazJTdEeI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 588b1b25-0db6-437f-fd0e-08d831393488
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2020 07:55:03.5525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMuInHzflIUyIBo9MFYQSf0H/xZryLQ5vsqv9dbC7ZqIRKeNru+eGrVl+iF/7gLVPW8WfDuAwV9stodxJgHfwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB1047
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_02:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007260058
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Deepak, thanks for the reminder. Miller also mentioned this to me. Now I=
 am follow the steps mentioned in Contributions.md to activate me account. =
I just signed OpenBMC ICLA and sent back to OpenBMC for the approval.
Thanks
Abner

> -----Original Message-----
> From: Deepak Kodihalli [mailto:dkodihal@linux.vnet.ibm.com]
> Sent: Sunday, July 26, 2020 3:41 PM
> To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>;
> suryakanth.sekar@linux.intel.com; Brad Bishop
> <bradleyb@fuzziesquirrel.com>; Patrick Williams <patrick@stwcx.xyz>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc
>=20
> On 25/07/20 9:18 am, Chang, Abner (HPS SW/FW Technologist) wrote:
> > Hi Sakar and Deepak,
> >
> > I create a PR https://github.com/openbmc/docs/pull/53 to fix content
> > rendering issue. Please take a look and merge it if you have no
> > problem with it.
>=20
> Hi Abner,
>=20
> We use Gerrit as the code review tool. Do you think you can push the same
> to Gerrit? Gerrit setup instructions are here -
> https://github.com/openbmc/docs/blob/master/development/gerrit-
> setup.md.
>=20
> Brad and Patrick maintain the openbmc/docs repo, so I would like to ask
> them - are you okay with merging PRs or must Abner push to Gerrit?
>=20
> Thanks,
> Deepak

