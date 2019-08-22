Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 847519A111
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 22:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dx1y1ycvzDrFD
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 06:28:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3137b8b9e0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BfSHw+z7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DwqeVlT8"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dx152Z0szDqgD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 06:27:48 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MKNigj008978; Thu, 22 Aug 2019 13:27:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=MJv7JX6YMFeNTBhvd1JCZFrLAHjFDMuITXBl1J1edv8=;
 b=BfSHw+z78LG3AQAV1yQ9yGrLiTjiFBl3GYybt0QCPe254Lwcds3iiscb3tXoTSVH+9DC
 GgfD/Uowa9mSDe0uwjNdTgRxzgG1aXWkqbni7KqTeNf8QwDtjQ2+fYHtCkL1nmrJ2yfk
 5xi0K4JTwG2A2qUnSKuLIieq1T0dMrNXy2Q= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uhxquryxq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 22 Aug 2019 13:27:42 -0700
Received: from prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 22 Aug 2019 13:27:38 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 22 Aug 2019 13:27:38 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Aug 2019 13:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGZKJxTwpVLCnBodoL2KmrqLYNojqgM7HZEekN/cNS+/SkaRS+gWAywdFZrUl6r/6eC06q7EzWjEMt6KBjq1hVndO+W3n8kxcVl8dgN5OYtGHr/wfM4ZlPlGi0zH5NI8P7o9HPlFlEWBBHDxZe3Ei9evfh4RxbEtlZmlvq6Dr7syjaMHCE8lIBFblxLfDYdQz484PEZQ6GMBHJOTw89pNoILM6W8cSS61VJuuiLiDQQxyHMJCh1mRXS3fRikcgg7zg05TExZn1+QOe6YxD5/5tDpG4eIw1Cm7gV8+97H5MccI4ra2L9EQqKgIDtjedItju4MjPCc7ZCmpnVu7ocSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJv7JX6YMFeNTBhvd1JCZFrLAHjFDMuITXBl1J1edv8=;
 b=I5VfcY4UAp/tscgI54J7CDLM0+Xe7uOdkzmlcchsXRp+efr9bvb190axGOJWWIheGtX3NLfXsdDAWnbgT/V/aNCy8W7Nx9nUIaW9e8vHA18QK+yKbDPa2BKfj8KpimjwadRCULn9Vee39PJdEoOT7+8I9Ls2vbVJkVMuumP7fQoif/YBnE/ZNpu4Zl93inMZefLES1NjXeuhTTtIYqFjYAslSm7FOVvs8GgvphcY3nGERYO39sbv6y8x7gm9Px9zS8FmG0YlJ6bHfnBwpFVP4ZE2B0ClQgxPUBcQyXqB2LqV6Q10TwkXpisv6Moihg/A65so2/6BdyhP57DRqYnOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJv7JX6YMFeNTBhvd1JCZFrLAHjFDMuITXBl1J1edv8=;
 b=DwqeVlT8FL3t7L5fZASK/lGzBArUFE88yEzhWvVS0+f6+JxpVBTlsO5+SkGCv6/fAF3+2kuCi1J2p4fJmy2U+7oxGmainwEDGVOxdqmIRqc7O2lHEctLxLAUGYtoE1v9J+dTrapflU8xLORCG37B6aq9UYHsrKvx4EaaN66DWX8=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1286.namprd15.prod.outlook.com (10.172.178.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 20:27:37 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 20:27:37 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, "Paul.Vancil@dell.com"
 <Paul.Vancil@dell.com>, "neladk@microsoft.com" <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eAAZhsAAABeOw0AACZIlAAAhMT0A
Date: Thu, 22 Aug 2019 20:27:37 +0000
Message-ID: <7C51D2AB-7154-43C4-9B6A-03C3FD27DF23@fb.com>
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
 <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
In-Reply-To: <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:7504]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75d834d0-2e4f-44c6-ec02-08d7273f2c3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1286; 
x-ms-traffictypediagnostic: CY4PR15MB1286:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB1286D199482E32D83E1F43C4DDA50@CY4PR15MB1286.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(366004)(396003)(136003)(199004)(189003)(478600001)(14444005)(305945005)(256004)(2906002)(8676002)(25786009)(2501003)(91956017)(76116006)(99286004)(81156014)(186003)(2201001)(446003)(7736002)(45080400002)(81166006)(76176011)(36756003)(316002)(8936002)(110136005)(5660300002)(6116002)(53546011)(6246003)(46003)(6512007)(6506007)(966005)(86362001)(1511001)(102836004)(14454004)(6436002)(11346002)(2616005)(66946007)(486006)(71190400001)(53936002)(71200400001)(476003)(6486002)(229853002)(64756008)(66476007)(66556008)(66446008)(33656002)(6306002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1286;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ERStaxBlyB/C6h/jJwHzwwW1WVthMmSlebl+/PdNZpkW2Oc4GONZkh0+/a/3A+xDzdA/6Bmk/OHforPwBCCw5H5CIsQ8vKJ/sofYtMW/0BPUerPQXADyC4wJ/4/+ZkLCfH4t/GBPrL+5sbrU6bmVpoJ800GBX9La3ubZNC+6CUW05d25wTWdMPKVzkFUklX/5GRcUvipLQFIXrFTZsvwlu80mFc6KOpwN4OrDy5esyk6xypF37gpFCM2xsAMbd4xck7qPD5xOPzga9alxtlNqB4E5ZnXdmDtRO+HSQPz8ON65VRFZsAW2iTnZz5cG1UI+nek3TXVLB4svcIzjyJfVa6aTrwFfPDRzLQDxTvZRLNEDRu3DgVGrrslbuUXkSAcnPAeSvBuwLh8/XVDiuM1qou/4xT0Vn5mkTV4pMDXSQ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <212D6FFA8B08284B9034DC5D4BAC69C7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d834d0-2e4f-44c6-ec02-08d7273f2c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 20:27:37.4007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXVnUPsKeWYf0j1soYESZY/JbOXJiaJghOKl/cCHvWT0o/JfsWq/LbIDU3mcJTELUGLYadzGj85TMC4fCNS73g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1286
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220176
X-FB-Internal: deliver
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

DQoNCu+7v09uIDgvMjEvMTksIDI6MzggUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBHdW5uYXIg
TWlsbHMiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGdtaWxsc0BsaW51eC52bmV0LmlibS5jb20+IHdyb3RlOg0KDQogICAg
DQogICAgT24gOC8yMS8yMDE5IDEyOjA4IFBNLCBQYXVsLlZhbmNpbEBkZWxsLmNvbSB3cm90ZToN
CiAgICA+IE5lZXJhaiwNCiAgICA+IEl0IHdvcmtzIGlmIHlvdSBoYXZlIGFjY2VzcyB0byB0aGUg
Z2l0aHViLmNvbS9ETVRGL1JlZGZpc2ggcmVwby4NCldlIGFzIEZhY2Vib29rIGFsc28gZG9uJ3Qg
aGF2ZSBhY2Nlc3MgdG8gdGhpcyBwcml2YXRlIHJlcG8uIENhbiB5b3UgcGxlYXNlIG1vdmUgdGhp
cyBpbnRvIG91ciBvcGVuYm1jIHJlcG8uDQogICAgDQogICAgSGkgTmVlcmFqLA0KICAgIA0KICAg
IExpbmsgd29ya2VkIGZvciBtZSBhcyB3ZWxsLg0KICAgIE1pY3Jvc29mdCBpcyBhIFJlZGZpc2gg
Rm9ydW0gU3VwcG9ydGVyIHNvIHlvdSBzaG91bGQgYmUgYWJsZSB0byBnZXQgDQogICAgYWNjZXNz
IHRvIHRoZSBnaXRodWIuY29tL0RNVEYvUmVkZmlzaCByZXBvIGJ5Og0KICAgIA0KICAgIDEuIEpv
aW5pbmcgdGhlIERNVEYgaGVyZTogaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3Yy
L3VybD91PWh0dHBzLTNBX193d3cuZG10Zi5vcmdfam9pbiZkPUR3SURhUSZjPTVWRDBSVHRObFRo
M3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVn
Jm09Q1JMVDBNajhkSUhoN1RzZkp5WVZUYkluMUlkQl9TTDVBcmVabk9saWFaTSZzPW9QM1dZdmhz
T1loOVdZaEUzRlR0dWdhdklRZDNnMUswQUN1a29aSjluSTAmZT0gDQogICAgMi4gQWZ0ZXIgam9p
bmluZyB0aGUgRE1URiwgam9pbiB0aGUgUmVkZmlzaCBmb3J1bSBoZXJlOiANCiAgICBodHRwczov
L3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX21lbWJlcnMuZG10
Zi5vcmdfYXBwc19vcmdfd29ya2dyb3VwX3BvcnRhbF8mZD1Ed0lEYVEmYz01VkQwUlR0TmxUaDN5
Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZt
PUNSTFQwTWo4ZElIaDdUc2ZKeVlWVGJJbjFJZEJfU0w1QXJlWm5PbGlhWk0mcz00TFV5cTNqS1pr
MS0tUk84b2VWTzBrS0QwODkwMGxRQkt6Vm44SERTNXFnJmU9IA0KICAgICAgICAgICAgIE1lbnUg
PiBHcm91cCA+IEFsbCBHcm91cHMgLS0gU2VsZWN0ICJSZWRmaXNoIEZvcnVtIg0KICAgIDMuIFNl
bmQgYW4gZW1haWwgdG8gdGhlIFJlZGZpc2ggZm9ydW0gYXNraW5nIGZvciB5b3VyIEdpdEh1YiBJ
RCB0byBiZSANCiAgICBnaXZlbiBhY2Nlc3MgdG8gdGhlIHByaXZhdGUgUmVkZmlzaCByZXBvc2l0
b3J5DQogICAgDQogICAgLSBHdW5uYXINCiAgICANCiAgICANCiAgICA+IEZvciB0aG9zZSB3aG8g
aGF2ZSBhY2Nlc3MgdG8gdGhlIERNVEYgcHJpdmF0ZSByZXBvIG9uIGdpdGh1YiwgVGhlIGxvY2F0
aW9uIG9mIHRoZSBjdXJyZW50IFRlbGVtZXRyeSBtb2NrdXAgaXM6DQogICAgPiAgIGh0dHBzOi8v
dXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbmFtMDYuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb21fLTNGdXJsLTNEaHR0cHMtMjUzQS0yNTJGLTI1MkZn
aXRodWIuY29tLTI1MkZETVRGLTI1MkZSZWRmaXNoLTI1MkZ0cmVlLTI1MkZtYXN0ZXItMjUyRm1v
Y2t1cHMtMjUyRnB1YmxpYy0yRHRlbGVtZXRyeS0yNmFtcC0zQmRhdGEtM0QwMi0yNTdDMDEtMjU3
Q25lbGFkay0yNTQwbWljcm9zb2Z0LmNvbS0yNTdDMjNlMjdhYTk2MjdhNDdiZTM4YmUwOGQ3MjVk
NGQwZjUtMjU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3LTI1N0MxLTI1N0MwLTI1
N0M2MzcwMTk0NjgyODYxMDQyNTktMjZhbXAtM0JzZGF0YS0zRFhaczBGTTdwOTdncmJTNTBFdVMw
bEFXay0yNTJCci0yNTJCYU11R3hSZVJTeGdaMUx2cy0yNTNELTI2YW1wLTNCcmVzZXJ2ZWQtM0Qw
JmQ9RHdJRGFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBW
Z3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1DUkxUME1qOGRJSGg3VHNmSnlZVlRiSW4xSWRCX1NM
NUFyZVpuT2xpYVpNJnM9Y3V0Ny1VOG1yMmMyX25pLTZBelN3SUJ4a1ROVGdNT0g3ekZ3TkNyRWU3
USZlPSANCiAgICA+DQogICAgDQoNCg==
