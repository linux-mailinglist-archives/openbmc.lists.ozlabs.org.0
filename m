Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88D3331A0
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 23:41:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw9Dk5Bwdz3cPm
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 09:41:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=xsp3Z/TO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=balaji.b.rao@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=xsp3Z/TO; dkim-atps=neutral
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw4FX6Gwpz30Gv
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 05:57:02 +1100 (AEDT)
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129FDL6T027331; Tue, 9 Mar 2021 10:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=c2rsJDRUiAR+E6iwMg4iLqxdF9cFbdtM7gZ6RsGFmeU=;
 b=xsp3Z/TOHZzR3UYhF7r3MqZdNijLf2WdPxHB/KBXW6iy5psxi+q/S/w586a7uGyjYXif
 n2NJQo1ZyGZm6xx2Iovc0WPPvC/d0ZSeqys7EiRUqDZufqCoNy6+YPEVT+lN7bIqIilb
 bhuRehZi0OW/vzSan7gNImdsADoQB1J+qFgVP67MhIThRC/4GImXOOA8ZXDXZT8ZGp2J
 Ovpu3bRXCLo+bqsrgu4jR1zLTcwhHbK8hz7orZWRb5Plnwcjfrg84tCzgFZ+TUXR6ZrQ
 7jhqkYDGn4QzfGDiJhuwZ1Q+n/T7g3rlwx5/KFqMwPkyVyMa19rTyFSNBUBBNo/i376Q Sg== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 3745s3s7ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 10:16:51 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129FCuhU088741; Tue, 9 Mar 2021 10:16:50 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0b-00154901.pphosted.com with ESMTP id 374qgtgp8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 10:16:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7BTKBgsvoLDxymSD8+e7HmLSXkHIZFX17jGGUwkfZE1ZunhRPW937p3Sl80I6E6VoHWcSq+SwWWkXWfDRyvTpT8K3aBOKoTeuiyTnrONby8Vcz3iqDOWsgrdD8Iks+zzzvQ2RVhZJQh/hB63tmqx2p410Vdk6ypYMbex3S0g7ITBfau6xTXuBfBMBUQIZLB7+eUUhI3VQPyxMJBRlw7kg6HZKgUvDi58LrPq7Ba4J9syZJRq98fzrJfv6NuveKW/LSfGD37t6qvIR1RLJzyU5IRNHuqmGwyy8A6aE55RciICLlgOVzriwWxE5+tUxF5oLXwYWgfsnA7RiyUFi3Hpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2rsJDRUiAR+E6iwMg4iLqxdF9cFbdtM7gZ6RsGFmeU=;
 b=hE687dBynfVCiQuttJ7m+oqe9ZICzxCul0jW5OgHTKHoOa3Xxy8JQRY6jaj3vVLbIQ5WuL0y5lbl1jccUCZRyHSIl26+WrxFGbe1xS1c1+YA2yT5HgshbvIQlBJ3op5nKs2nfNjMmFTgZ3+q/9YC36vM1dyMasL+xv+/ctfoctwJq3GJVDdHHaRgiZ4exTbW9TUpMoyihAlMsuEKL32T9tHcUj3EHO2eRaIhK4J29lV0e0MaH8b8Ewf3gvUlQ9uTyHLzfgsJRVeXli/V/LvYPcL/SGO1qCE6XK1qmFYoXw+UKWz9q0UZ2FS2KX7P67Jqvg6p10WkXM/IfzvjKoxdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4574.namprd19.prod.outlook.com (2603:10b6:a03:283::14)
 by BYAPR19MB2501.namprd19.prod.outlook.com (2603:10b6:a03:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 15:16:48 +0000
Received: from SJ0PR19MB4574.namprd19.prod.outlook.com
 ([fe80::b154:e9ad:cb98:19b4]) by SJ0PR19MB4574.namprd19.prod.outlook.com
 ([fe80::b154:e9ad:cb98:19b4%3]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 15:16:48 +0000
From: "Rao, Balaji B" <Balaji.B.Rao@dell.com>
To: "Giles, Joshua" <Joshua.Giles@dell.com>, Ed Tanous <edtanous@google.com>
Subject: RE: ObjectMapper & Redfish Update Service: Software.Activation
 Missing (SW Version Mgmt & Image Update)
Thread-Topic: ObjectMapper & Redfish Update Service: Software.Activation
 Missing (SW Version Mgmt & Image Update)
Thread-Index: AdcU9RfwkTp+VM+oRIKXZejr+c5iLwAAfe5w
Date: Tue, 9 Mar 2021 15:16:48 +0000
Message-ID: <SJ0PR19MB4574A269575388C7CE8575BEA7929@SJ0PR19MB4574.namprd19.prod.outlook.com>
References: <DM6PR19MB3561D5FB2E6B326E1ABD8E8C95929@DM6PR19MB3561.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB3561D5FB2E6B326E1ABD8E8C95929@DM6PR19MB3561.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Balaji_B_Rao@dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-09T15:16:46.7609660Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e55c60d4-0f5b-48f1-a082-c5fa9a2225d6;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: Dell.com; dkim=none (message not signed)
 header.d=none;Dell.com; dmarc=none action=none header.from=dell.com;
x-originating-ip: [75.31.22.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5678f12b-9f6b-49b8-dabb-08d8e30e5be4
x-ms-traffictypediagnostic: BYAPR19MB2501:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR19MB25013E9672B20E7A9FF5212AA7929@BYAPR19MB2501.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hNHsmEnzo2zUW8QvvXsTjWKIl1z+lRMyfYHc5y3z2I8v/rbW8x3jJjw4ZCCcw01GgUqXdNaqs1B3A0ikr3qfV9vUwl+n384a+wvQkE6jhm20JUJHEeTSKVMEzovrq0nAorUYavK20eRYA7lLh3Gwj9L0f/11DgzLsqXRuHD20HQdcns/YFguHjYIx5dxwzJk8syNJXogrXrt1z24a2GQruhdQLVaHNbcmeC+nrjEJaeSvG+8Tq0AV0GAMMaq24f1Ih5mcd7QLupKYvAMLQzh6HRihynm3rAQ0fxaVcmtRTCkC6GNgeXEq5snYkNPt/XUT04owFFBnrFt5Oj9+MD6iHppNMHjnQ7Uoo+szAubois7oMGb7uOOcz5GZYmivfmRATa+Qy0s+Bq22iNcz8k5oqgcSOYZZMRevNq2FNFl/kgjTAMX+0JrtSlyT7aH9Ptp0/rigtUjwVXZMWRcMN9mooenj+hptrW02ON4XK1mSaS5zsP9FpdMLalmF36GUaSMnPrb3oJ2s5BenSAc7ZGi7pZfVIzEZNB2MuX/x+xTDYCHLlXcIReNaN+RYzc/W8uJnxW5T9JXkxtNVXMjZDnk6GsGvjazMWuA9q4PjJXs+w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4574.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(786003)(316002)(2906002)(9686003)(71200400001)(54906003)(83380400001)(33656002)(15650500001)(8676002)(8936002)(76116006)(110136005)(5660300002)(55016002)(66476007)(64756008)(26005)(66556008)(966005)(52536014)(186003)(53546011)(6506007)(478600001)(7696005)(66946007)(66446008)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VnRqeW9jemdkMytKRmZrSjJTWXp1Z0ExdE5KN2Juamoxd3M4bGEzQWtLOGpO?=
 =?utf-8?B?MDY4RmVZK0pTZ3ltUElyWGd0MXN0YjBoQTVXYTJUd1oySUlzQzFMdThaZnhW?=
 =?utf-8?B?S2orQVV6SEtXamtoSG1HZW5kZmF5QlhyRGVZODZiT3BFUTdkZFhqdUFrWVdB?=
 =?utf-8?B?L3Y5cWYxTmw1QitJbHNrMjVGYXMvMkVWZ2IwUmd3L1pQeFN6NUFaT3MyRlRk?=
 =?utf-8?B?U2NUTVNGKzRrdmxoNlJ3OThHWUN2cS9iQTdBbEoxNkUvaXJBZ0I4TFJPUll0?=
 =?utf-8?B?OTlkSnUxa1dST0cwQlBDVGwra3dsTUxsTWtoVTd5UDh5VHRXQk1RWENnY2Z1?=
 =?utf-8?B?akNTOWt4elF3cFdNUytyaVNNWHlIaEtua2Fiamt6dXBLWGZveWdvV3MrSXd6?=
 =?utf-8?B?L0w0NnVMK1VSM1FkSHc4WnNadElIMlZIU3JPZFNGN2kycnEwZzlHakhPMFBu?=
 =?utf-8?B?dnE3bUd6WDd2NnUzK1F2TzB4NkxOc25GYWpIaGZyYXlxczFjR2t2TnBqMFF5?=
 =?utf-8?B?cFo0TmtNMjZWVnhmRjJpd09qbFVSdFdjL1E0cVdBMVFnWlhXTGI5S0locGR4?=
 =?utf-8?B?VzZhV2MzbVBTUVVYMXU3OXlQdFM4QmR0bDJwVTUyNFZEWEcyOEVDQm1od2h5?=
 =?utf-8?B?KysrSEVndVE3S1FkeW9aeHVUaFEzRDJLSk56NUpFTHkwZmplVmRaQ0RIZlFV?=
 =?utf-8?B?c1JiQ0ZsUlpxdnN6Mldwemh3RFhPYk9WYVkrUlltbnJWaklTMGtkYU9SWDE3?=
 =?utf-8?B?WUJLbm1kWWY2T2d0K3RxY2xhOG0zVDdodXlxZHpoWHJRdUdqTjAwa3Zvalh2?=
 =?utf-8?B?b080NW9FZGI2V0kyRm5Nb0tkUFVjRWRnR3VtS2NKMEJFYzFZK1JxdDRzMVBY?=
 =?utf-8?B?eHloY2taV25QYmdKcko5V3dFOTcxWm03Nmd6MlNoN1lXb1hmTU9CdTlOOUpT?=
 =?utf-8?B?eTF4WGVVWGVKei9pOHg5N3o2TXExaE05bHhveHdyTFBxR21Na0p6OXI3REJJ?=
 =?utf-8?B?cUxVTm4xdUduN2dWZ2FtN3ZsWW9FZU9KZU4zQ1NUSHE0K3NwNm5aUUV5VUF3?=
 =?utf-8?B?UTBuMTJPQ0I5WWQ5a2lhOXN3cUtxaGpiQ3JkWXJwQmFHNkZEamkvNDhHaEFL?=
 =?utf-8?B?dTk5eFc4V2RnNEtLK2FjOFVFVXRKN2ZzY0VrU0I4SHI4MjJ1a1RrSVliSDNR?=
 =?utf-8?B?ZnBMalhUMVkrRDdkalNkSlVSZkcvZGFVdVpya1p6SEhLcWI5MmF6RCtTamVu?=
 =?utf-8?B?bFVGQzJRVTlJcGFjbWk5QmpGYWpsQWh0WndFOUpTeXdid1Mrb3ZPRVVEajli?=
 =?utf-8?B?M21GcUZEMkYxSmhsTUN0R0VKNVpSOXVHQkFxY2JJdkcrWTBYbmJWWWMxUExS?=
 =?utf-8?B?UkFTTTlCN1ZHZHVOcXZGYU8yTFZwMTVEeEtvRHVQeDFJTEJIaXVJNnBKVG5s?=
 =?utf-8?B?ZXc3RzdqWmw3Y2R1eEMxdzRIOFdBRnZmTDZSNFcvZWN1RUl1UTlOUmRBWlhz?=
 =?utf-8?B?RzhKNUV0WVNCZDErZlpheVlTMlZuYWxORUNmRUliQnJhRVFkOXFNakZSRU80?=
 =?utf-8?B?NGxEZ3E2NXBldzV1ZFNyRngwbHh4ajUvdmFPblRGak04WVpmRllHRnYybnNQ?=
 =?utf-8?B?MWc5WnJrRE1JTy9XbWoxMW90cVI5S283VFBZR1lzZFkveENGUkl2aXNTOFYz?=
 =?utf-8?B?WnhBSEEzVDNPYVl2ektqQktob0dpUk5JOVZQV0JadUltQnpYU0VWSGxVMGhz?=
 =?utf-8?Q?8YyDbudAVRc2rMYA0o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4574.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5678f12b-9f6b-49b8-dabb-08d8e30e5be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 15:16:48.2731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2wB7jzzIF4PKgC+iuDUt+kE0Agpz8aYW83yZ3X77Gm1on7XX7Ae3teNNgVowInfAqXtzVtBoEgONd8SVZ3XDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR19MB2501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103090078
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090078
X-Mailman-Approved-At: Wed, 10 Mar 2021 09:40:59 +1100
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpUaGFuayBKb3NoIGZvciBpbml0aWF0aW5nIHRoaXMgdGhyZWFkLiBUaGUgaXNz
dWUgdGhhdCB3ZSBkaXNjb3ZlcmVkIGlzIHRoYXQgb2JqZWN0IG1hcHBlciBkb2VzbuKAmXQgY2Fj
aGUgdGhlIGNyZWF0ZWQgaW50ZXJmYWNlcyBpbW1lZGlhdGVseSBlc3BlY2lhbGx5IHdoZW4gdGhl
IGFzc29jaWF0aW9ucyBhcmUgY2hhbmdlZC4gSWYgdGhlIG1hcHBlciBpcyByZXN0YXJ0ZWQsIGl0
IHNob3dzIHVwLiBJJ20gY2hhcmFjdGVyaXppbmcgaXQgYSBiaXQgYmVmb3JlIGFuIGlzc3VlIGlz
IG9wZW5lZCBmcm9tIG91ciBlbmQuIEFueSB0aG91Z2h0cyAvIHBvaW50ZXJzIGFyZSBoaWdobHkg
YXBwcmVjaWF0ZWQuDQoNClRoYW5rcywNCg0KQmFsYWppIFJhbw0KRGlzdGluZ3Vpc2hlZCBNZW1i
ZXIgVGVjaG5pY2FsIFN0YWZmDQpEZWxswqBFTUPCoHwgRmlybXdhcmUgRW5naW5lZXJpbmcNCisx
LTUxMi03MjgtMjk3MSAvIEJhbGFqaS5CLlJhb0BEZWxsLmNvbQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogR2lsZXMsIEpvc2h1YSA8Sm9zaHVhX0dpbGVzQERlbGwuY29tPiAN
ClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDksIDIwMjEgOTowMiBBTQ0KVG86IEVkIFRhbm91cw0KQ2M6
IFJhbywgQmFsYWppIEI7IEJyYWQgQmlzaG9wOyBvcGVuYm1jOyBFZCBUYW5vdXM7IEd1bm5hciBN
aWxscw0KU3ViamVjdDogT2JqZWN0TWFwcGVyICYgUmVkZmlzaCBVcGRhdGUgU2VydmljZTogU29m
dHdhcmUuQWN0aXZhdGlvbiBNaXNzaW5nIChTVyBWZXJzaW9uIE1nbXQgJiBJbWFnZSBVcGRhdGUp
DQoNCkhlbGxvIGFsbCwNCg0KUHJvYmxlbToNCk15IGNvbGxlYWd1ZSBCYWxhamkgUmFvIGFuZCBJ
IGFyZSBsb29raW5nIGF0IFJlZGZpc2ggKyBJdGVtIFVwZGF0ZXIgaW1wbGVtZW50YXRpb24gYW5k
IGZvdW5kIHNvbWUgdW5leHBlY3RlZCAoSSdtIGEgbmV3YmllKSBiZWhhdmlvciBjb21pbmcgZnJv
bSBwcm9jZXNzZXMgaW52b2x2ZWQuDQpJbiBwYXJ0aWN1bGFyLCB0aGVyZSBpcyBzb21lIGRpc2Ny
ZXBhbmN5L2Rpc2FncmVlbWVudCBhcm91bmQgdGhlIE9iamVjdE1hcHBlci5HZXRPYmplY3QgdmVy
c3VzIGludHJvc3BlY3Rpb24gb2YgdGhlIC9zb2Z0d2FyZS88aWQ+IGludGVyZmFjZXMuLi4NCg0K
SW50ZXJmYWNlcyBtaXNzaW5nDQo9PT09PT09PT09PT09PT0NCkFGQUlDVCwgUkYgdXBkYXRlX3Nl
cnZpY2UuY3BwIGhhcyBhIHRocmVhZCB0aGF0IG1vbml0b3JzIGFuZCBjeWNsZXMgdGhyb3VnaCB0
aGUgaW50ZXJmYWNlcyBvZiB0aGUgb2JqZWN0IGluIHF1ZXN0aW9uIC94eXovb3BlbmJtY19wcm9q
ZWN0L3NvZnR3YXJlLzxpZD4gYW5kIHdoZW4gaXQgZmluZHMgdGhlIOKAnOKAplNvZnR3YXJlLkFj
dGl2YXRpb27igJ0gaW50ZXJmYWNlLCBpdCB3aWxsIGFjdGl2YXRlIHRoZSBpbWFnZSBieSBzZXR0
aW5nIHRoZSBSZXF1ZXN0ZWRBY3RpdmF0aW9uIHByb3BlcnR5IHRvIOKAnEFjdGl2ZS7igJ0NCg0K
VGhpcyBmcmFtZXdvcmsgd29ya3MgZmluZSBmb3IgQk1DIHVwZGF0ZXMgYnV0IEkgc2VlIHRoYXQg
Zm9yIG91ciBCSU9TL0hvc3QgdXBkYXRlcyBSRiBvbmx5IGZpbmRzIHNvbWUgaW50ZXJmYWNlcyB0
aGVuIGNvbXBsZXRlcyAoZXhpdCBvdXQgb2YgaW1hZ2VfbWFuYWdlcl9tYWluLmNwcCk7IFJGIHRo
cmVhZCB0aW1lcyBvdXQgKDEwbWluKSB3aXRob3V0IGZpbmRpbmcgdGhlIFNvZnR3YXJlLkFjdGl2
YXRpb24gaW50ZXJmYWNlLg0KDQpIZWxwIFdhbnRlZA0KPT09PT09PT09PT0NCk5vdCB1bnRpbCB0
aGUgb2JqZWN0IG1hcHBlciBzZXJ2aWNlIGlzIHJlc3RhcnRlZCBkbyBJIHNlZSB0aGUgZXhwZWN0
ZWQgaW50ZXJmYWNlcyBwb3B1bGF0ZS4NCkxvb2tpbmcgZm9yIHNvbWUgZ3VpZGFuY2Ugb24gdGhp
cyBSRjwtPk9iamVjdE1hcHBlciByZWxhdGlvbnNoaXAsIGtub3duIHByb2JsZW1zIHdpdGggT00g
b3IgZGlmZmVyZW50IHdheXMgb2Ygc2VhcmNoaW5nIGZvciB0aGVzZSBpbnRlcmZhY2VzLg0KUmVw
cm8gb2JzZXJ2YXRpb24gU3RlcHMgMS01IGJlbG93Li4uDQoNClN0ZXBzDQo9PT09DQoxLikgR2l2
ZW4gYW4gdXBsb2FkIG9mIGEgaG9zdCB1cGRhdGUgcGFja2FnZSB3ZSBzZWUgdGhlIG9iamVjdCBp
biB0aGUgYXBwcm9wcmlhdGUgdXBkYXRlciBhbmQgdmVyc2lvbiBzZXJ2aWNlczoNCiMgYnVzY3Rs
IHRyZWUgeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5CSU9TLlVwZGF0ZXINCmAtL3h5eg0K
ICBgLS94eXovb3BlbmJtY19wcm9qZWN0DQogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0
d2FyZQ0KICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS9mMTRmMmQxNQ0KIyBi
dXNjdGwgdHJlZSB4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLlZlcnNpb24NCmAtL3h5eg0K
ICBgLS94eXovb3BlbmJtY19wcm9qZWN0DQogICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0
d2FyZQ0KICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdC9zb2Z0d2FyZS9mMTRmMmQxNQ0KDQoN
CjIuKSBpbnRyb3NwZWN0aW9uIHNob3VsZCBzaG93IHVzIHRoZSAiU29mdHdhcmUuQWN0aXZhdGlv
biIgaW50ZXJmYWNlIGFuZCBkb2VzOiANCiMgYnVzY3RsIGludHJvc3BlY3QgeHl6Lm9wZW5ibWNf
cHJvamVjdC5Tb2Z0d2FyZS5CSU9TLlVwZGF0ZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdh
cmUvZjE0ZjJkMTUNCk5BTUUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
VFlQRSAgICAgIFNJR05BVFVSRSBSRVNVTFQvVkFMVUUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEZMQUdTDQpvcmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZSAgICAgICAgIGlu
dGVyZmFjZSAtICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtDQouSW50cm9zcGVjdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1ldGhvZCAg
ICAtICAgICAgICAgcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtDQou
Li4NCltzbmlwXQ0KeHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5BY3RpdmF0aW9uICAgICBp
bnRlcmZhY2UgLSAgICAgICAgIC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLQ0KLkFjdGl2YXRpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcm9wZXJ0
eSAgcyAgICAgICAgICJ4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXQuLi4gZW1p
dHMtY2hhbmdlIHdyaXRhYmxlDQouUmVxdWVzdGVkQWN0aXZhdGlvbiAgICAgICAgICAgICAgICAg
ICAgICAgIHByb3BlcnR5ICBzICAgICAgICAgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUu
QWN0aXZhdC4uLiBlbWl0cy1jaGFuZ2Ugd3JpdGFibGUNCiBbL3NuaXBdDQoNCjMuKSBIb3dldmVy
IEdldE9iamVjdCBkb2VzIG5vdCBzaG93IHRoaXMgaW50ZXJmYWNlIGFuZCBfbG9va3NfIGluY29t
cGxldGUgKG9ubHkgMSBkaWN0aW9uYXJ5KSB3aGVuIGNvbXBhcmVkIHRvIHRoZSBibWMgZXF1aXZh
bGVudCAoMiBkaWN0aW9uYXJpZXMpLi4ubm90IHN1cmUgaG93IHRoaXMgd29ya3Mgb3Igd2hhdCBp
dCBtZWFucyB0aG91Z2guLi4NCiMgZGJ1cy1zZW5kIC0tc3lzdGVtIC0tcHJpbnQtcmVwbHkgLS1k
ZXN0PXh5ei5vcGVuYm1jX3Byb2plY3QuT2JqZWN0TWFwcGVyIC94eXovb3BlbmJtY19wcm9qZWN0
L29iamVjdF9tYXBwZXIgeHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBwZXIuR2V0T2JqZWN0
IHN0cmluZzoiL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvZjE0ZjJkMTUiIGFycmF5OnN0
cmluZzoNCm1ldGhvZCByZXR1cm4gdGltZT0xNjE0OTU3OTE1LjMyNjAzMSBzZW5kZXI9OjEuMjcg
LT4gZGVzdGluYXRpb249OjEuODQ4IHNlcmlhbD01MTg3IHJlcGx5X3NlcmlhbD0yDQogICBhcnJh
eSBbDQogICAgICBkaWN0IGVudHJ5KA0KICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9q
ZWN0LlNvZnR3YXJlLlZlcnNpb24iDQogICAgICAgICBhcnJheSBbDQogICAgICAgICAgICBzdHJp
bmcgIm9yZy5mcmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlIg0KICAgICAgICAgICAgc3Ry
aW5nICJvcmcuZnJlZWRlc2t0b3AuREJ1cy5QZWVyIg0KICAgICAgICAgICAgc3RyaW5nICJvcmcu
ZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3Bl
bmJtY19wcm9qZWN0LkNvbW1vbi5GaWxlUGF0aCINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9w
ZW5ibWNfcHJvamVjdC5PYmplY3QuRGVsZXRlIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3Bl
bmJtY19wcm9qZWN0LlNvZnR3YXJlLlZlcnNpb24iDQogICAgICAgICBdDQogICAgICApDQogICBd
DQoNCjQuKSBnZXQtbWFwcGVyIHNob3dzIFNvZnR3YXJlLlZlcnNpb24gdG8gYmUgdGhlIHNlcnZp
Y2UgYXNzb2NpYXRlZCB3aXRoIHRoaXMgb2JqZWN0ICNtYXBwZXIgZ2V0LXNlcnZpY2UgL3h5ei9v
cGVuYm1jX3Byb2plY3Qvc29mdHdhcmUvZjE0ZjJkMTUNCnh5ei5vcGVuYm1jX3Byb2plY3QuU29m
dHdhcmUuVmVyc2lvbg0KDQo1LikgSG93ZXZlciwgcmVzdGFydGluZyBPTSBhcHBlYXJzIHRvIHBv
cHVsYXRlIHRoZSBtaXNzaW5nIGludGVyZmFjZXMvZGljdGlvbmFyaWVzLi4ud2hhdCBnaXZlcz8g
DQojc3lzdGVtY3RsIHJlc3RhcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5PYmplY3RNYXBwZXIgI2Ri
dXMtc2VuZCAtLXN5c3RlbSAtLXByaW50LXJlcGx5IC0tZGVzdD14eXoub3BlbmJtY19wcm9qZWN0
Lk9iamVjdE1hcHBlciAveHl6L29wZW5ibWNfcHJvamVjdC9vYmplY3RfbWFwcGVyIHh5ei5vcGVu
Ym1jX3Byb2plY3QuT2JqZWN0TWFwcGVyLkdldE9iamVjdCBzdHJpbmc6Ii94eXovb3BlbmJtY19w
cm9qZWN0L3NvZnR3YXJlL2YxNGYyZDE1IiBhcnJheTpzdHJpbmc6IA0KbWV0aG9kIHJldHVybiB0
aW1lPTE2MTUyMzE1MzMuODU5NDc5IHNlbmRlcj06MS40NDk4IC0+IGRlc3RpbmF0aW9uPToxLjQ1
MTcgc2VyaWFsPTEyODcgcmVwbHlfc2VyaWFsPTINCiAgIGFycmF5IFsNCiAgICAgIGRpY3QgZW50
cnkoDQogICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQklPUy5V
cGRhdGVyIg0KICAgICAgICAgYXJyYXkgWw0KICAgICAgICAgICAgc3RyaW5nICJvcmcuZnJlZWRl
c2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJsZSINCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVk
ZXNrdG9wLkRCdXMuUGVlciINCiAgICAgICAgICAgIHN0cmluZyAib3JnLmZyZWVkZXNrdG9wLkRC
dXMuUHJvcGVydGllcyINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJvamVjdC5B
c3NvY2lhdGlvbi5EZWZpbml0aW9ucyINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNf
cHJvamVjdC5Db21tb24uRmlsZVBhdGgiDQogICAgICAgICAgICBzdHJpbmcgInh5ei5vcGVuYm1j
X3Byb2plY3QuT2JqZWN0LkRlbGV0ZSINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNf
cHJvamVjdC5Tb2Z0d2FyZS5BY3RpdmF0aW9uIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3Bl
bmJtY19wcm9qZWN0LlNvZnR3YXJlLlZlcnNpb24iDQogICAgICAgICBdDQogICAgICApDQogICAg
ICBkaWN0IGVudHJ5KA0KICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3
YXJlLlZlcnNpb24iDQogICAgICAgICBhcnJheSBbDQogICAgICAgICAgICBzdHJpbmcgIm9yZy5m
cmVlZGVza3RvcC5EQnVzLkludHJvc3BlY3RhYmxlIg0KICAgICAgICAgICAgc3RyaW5nICJvcmcu
ZnJlZWRlc2t0b3AuREJ1cy5QZWVyIg0KICAgICAgICAgICAgc3RyaW5nICJvcmcuZnJlZWRlc2t0
b3AuREJ1cy5Qcm9wZXJ0aWVzIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9q
ZWN0LkNvbW1vbi5GaWxlUGF0aCINCiAgICAgICAgICAgIHN0cmluZyAieHl6Lm9wZW5ibWNfcHJv
amVjdC5PYmplY3QuRGVsZXRlIg0KICAgICAgICAgICAgc3RyaW5nICJ4eXoub3BlbmJtY19wcm9q
ZWN0LlNvZnR3YXJlLlZlcnNpb24iDQogICAgICAgICBdDQogICAgICApDQogICBdDQoNClJlZmVy
ZW5jZXMNCj09PT09PT09PQ0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21h
c3Rlci9hcmNoaXRlY3R1cmUvb2JqZWN0LW1hcHBlci5tZA0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9hcmNoaXRlY3R1cmUvY29kZS11cGRhdGUvY29kZS11cGRh
dGUubWQNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNl
cy90cmVlL21hc3Rlci94eXovb3BlbmJtY19wcm9qZWN0L1NvZnR3YXJlDQoNCi1Kb3NoIEdpbGVz
DQoNCg==
