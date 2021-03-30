Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508234DD90
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 03:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8X3j3vSYz303J
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 12:31:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=b+SaMWmt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dell.com (client-ip=148.163.133.20;
 helo=mx0a-00154904.pphosted.com; envelope-from=prashanth.giri@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256
 header.s=smtpout1 header.b=b+SaMWmt; dkim-atps=neutral
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8X3P5sRpz2yxY
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 12:31:26 +1100 (AEDT)
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U1RZd9028268; Mon, 29 Mar 2021 21:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Ah5vbFgTs86CmYVYG8+Nai3YELsCrPwbN6gLuR9SimY=;
 b=b+SaMWmtwIRByjyZWSu8TkDnk2Ns9H5FKsrjF6KwqXB0uHbQWtbapsbOpybXp5EslBn4
 xEqChXxUkWr7TKoRU9zTCBTasUfTNxSf+Jx7eZWd7MszxaQJFa7fOroizz5RFmwySLnt
 YTbtdyLNM1bn8vObTNLIfgf3p9D5allVvizF7V9B0MA3pacz5YDSKEqmO7N+CLxk4MmG
 x5o3DnLjc6AAST88ir6zrtbtFzwU7l35LGFKa8t+GdAcyq3l2KncdA8jDvlPhAKs3tEF
 8Dgpaj8CLzyTcx+BG+0Y1KegJJbnCqgWSVlWYm7FEthHbKI8POfcgTKsfNAZocWIozHG NA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37kha21u2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 21:31:21 -0400
Received: from pps.filterd (m0133268.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U1UXfY042877; Mon, 29 Mar 2021 21:31:21 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0a-00154901.pphosted.com with ESMTP id 37jjay8hke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:31:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIFbzLLHQvb1xiEx7bEzaZ6FFEMeR4vEVEU1HqZ6e6MsTAWS0JzedAwSOCEGi0URejOrz18cModfINPGV/Tv+2Cc1VSWG+jWt56pa+4i+nD93KGCZ/GgVhvcsFg+OJ4n9mqhLvKn5AV0gsLAuxGYqQSioWh1c/T2lYWebSSsI6wEjKKeR3MdohUVJo38GKq+BAv7fQIGEJxf3mZEwvv7M+d7jDhex+hg6x199LOu3KuiVRMh02GPv0SkN5sWK7yxOQzyQTIlPyBp6Mip1FwfnVfTKLqaqjagVnradQcJVq9REF7m7vOFcaIrJIXuD6obwHoXBIghahC9W/S0/SLBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah5vbFgTs86CmYVYG8+Nai3YELsCrPwbN6gLuR9SimY=;
 b=FSJw938HRJYNWmNgAOduUDQABRa9bJ/FOninshiGgGuECEPXA8AAam7/9f0Wm1A+KQpBXkFf0+NQf67Of6IR+mS0DJNl82tWDV/nA0TxnUvZ89g4ItF0IDtYlxfk/IkOsxcdL8Ns5e2/MtqOSJWeA5x76ZvXNaZRcQvlKs9T2G89NsQCeXpeQcwIw8gywdtOUYDQ6q8pLjd22lHyuadBGH4giQ9FjiLd2dNUlyA9p0HEHSES2FUqb9uUml+1mj08i47rFVHIvVVsudO4xmGqVFytEyV5+L2j5F5QRifKiqEMtyk/EzX6MqtfAVIeJgzA+Rn5KQnCs027VoV35B7oKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB3417.namprd19.prod.outlook.com (2603:10b6:5:18d::30)
 by DM6PR19MB2444.namprd19.prod.outlook.com (2603:10b6:5:15f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 01:31:19 +0000
Received: from DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3]) by DM6PR19MB3417.namprd19.prod.outlook.com
 ([fe80::1915:7f2c:fe1a:b4d3%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 01:31:19 +0000
From: "Giri, Prashanth" <Prashanth.Giri@dell.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: License of generated code by sdbus++
Thread-Topic: License of generated code by sdbus++
Thread-Index: Adcg8CNwtb6flRC2TFKefB3mCSU/7ACHy6sAAH0PSIA=
Date: Tue, 30 Mar 2021 01:31:19 +0000
Message-ID: <DM6PR19MB341739172526BC708BB73FE5957D9@DM6PR19MB3417.namprd19.prod.outlook.com>
References: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
 <YF82wrt7FUCr59/U@heinlein>
In-Reply-To: <YF82wrt7FUCr59/U@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Prashanth_Giri@Dell.com; 
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-30T01:31:17.6631396Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1d4a4a4e-cda4-4467-841b-95915b616891;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [65.36.111.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7d76251-07e1-4a87-9e67-08d8f31b84e5
x-ms-traffictypediagnostic: DM6PR19MB2444:
x-microsoft-antispam-prvs: <DM6PR19MB24440497BD058684EDEAE49D957D9@DM6PR19MB2444.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k/Y0G4epKlFxSj954k4lhJmGhb/AfHtpOGVFaPYyTlK9Hwnz4XAIpVEQiMBL0PvbU+OFEyaNoNFeOE0iqALx8AVxticRBdBpcmM+tLG3CBQtPw6Ew0PrU8F5JPF4aTeOJk2qPWIHea//wGLJNn+rD5Up5xcmvQGhJm5b0/C4QrHSN546SFY/D+t+X4xtY8/SZOkEJp2C7+IepdnqBRQ5bmrchyKC8+RDFFHp/8ClunegiTnTEPsfO8vKSO17MxqEW6JWI+rVcczZ5Jb6mejVEG8R+46bO2+Db8j/ufvvV6dUU26SnUDo31xmVU9gF/KYGw+W+Vu6XvBIPhdFxCjToLcUdcbs5DgVGbe8BQI/ESZIzqLYtGVomQGF2EZXNOUPgsxE4G0Bz+u/Uo6D80gTGOlDtv7CUG5zk8XY0tc8SttHktlhHWXrNxidcrt3F4JrpeujYK2OLfFWDuMRqNLG5D/8JfeneHIpfxvRJ80lerATVARIbXUo/QVGDw35f86UmpROlzEINMKasjvyuvcGHBkzayNIg90Bv4cDaiAPuWKUY2q0/wtQLqeZWGKp4mAH1ZSkNkfnp2sGjULzg7V8Ak4mbdx4dCPbKA74PyC9o5x6YYdLr6d1ZJxtvzkwALUq7KLGLzIEkGak0V1f606PJB1POm+xYWKH9/tqYeLugzyRxOjSfaUtDpXQ46pJ5+90eGRA8vOjniybfcCipsZBeCzfJkGBLN3j6vFUUe1P3zo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3417.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(478600001)(2906002)(66946007)(66556008)(66476007)(64756008)(786003)(33656002)(71200400001)(83380400001)(6506007)(316002)(6916009)(8936002)(186003)(55016002)(8676002)(86362001)(38100700001)(966005)(66446008)(26005)(4326008)(9686003)(5660300002)(52536014)(7696005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Vx8MLcW/LV6aHZTCIgfSBGq0Sk76W43kfm+Nh0jCo+GprUI6k5n6gCt/CtSr?=
 =?us-ascii?Q?KRhuAsiZTjlPXUhspZdpKFoYMA+PuHc/nWfCvYYt16lkgA3ATQqn/yV/scNY?=
 =?us-ascii?Q?WsajgmyvBH2rHVVWNOrD2QV/pXtIovb+wRDz9/28AzmFceDRy4KK9YyVUXA2?=
 =?us-ascii?Q?9u10LssriiiZmVu2zZVixs38iegbokI6r36n5RJ2eKdA8I5VGC9OVpCg7x54?=
 =?us-ascii?Q?y9VAAef5Rt9UE09HIUeGbcJw6hF3F1XV4yj7s5In3OQ+yz+7xT2PiAklF56q?=
 =?us-ascii?Q?7k24oJERuHABK7FkA2YaLwxpgUm+UWz+n6RAkunyvQGpiNoIsVYawEbERuTK?=
 =?us-ascii?Q?w1ycNd2vNAOncFvRk7leRVY4Ohb5jbGpcmoykN9zdNEeFalZc3t6KQG/OY0k?=
 =?us-ascii?Q?znZUi1l+g28R/h0v7qkajoaDM/7YDJVbqvK+UoNb9pgvH5NB1RqOcgRor2qO?=
 =?us-ascii?Q?fNqGCvTCq73MbXssZLNb35F6Rgz4AgKgyERnIfSL6tnXCc33dRTDW5FPRdWR?=
 =?us-ascii?Q?YNDpRdOS6VGOWTkJFhVlL9uk6GaCcggYitnaBldkArCyeN09XO82EKXgn/RG?=
 =?us-ascii?Q?TQ76s9F5MZo9XdJwC7aUmbfM6Sha6hR54lzj7q4v8h+w4FG61FV9qM3QdQnV?=
 =?us-ascii?Q?SMkcCGJc6gOJ5NudTiItVEwL8SbMko44n3jR1C5ta4QqJdEMnn8OJhyY8ABd?=
 =?us-ascii?Q?5hI7oKOfnKyBrnv6jzRbloTvHLTxZdL/wtiwK4lwZIhUZL5SXccmKNFAmqxx?=
 =?us-ascii?Q?nXDUk2p+M9eJ2u66vvtk8D8iOqHN5ylPwGne0sk/+fS0Yf7kCGONKZtnrw01?=
 =?us-ascii?Q?9KyFKp4NcKCjY4Nrt80LcGEwMmUnwbyhwQyVb9opxB+X1oXDExy4XnObvNxR?=
 =?us-ascii?Q?LaCYrhOaQLLBS+3euG8ftMHuoVpEw7N4/nCo4jBseFGiboWISCJgJ6ftSfaT?=
 =?us-ascii?Q?Nn9/rsn/ZatNNYfbluf+U3p+YAPmAFJB+/PfsHuFoKgSz73L0IgH9QEtwFaT?=
 =?us-ascii?Q?sQLkXCJkA2hRMCAle/LQxk4rnAj1XKIC/iFiyJfH00lsuD1BTgSQNQkeBWd5?=
 =?us-ascii?Q?acgRkHLZbiDBMIsoqyqC9k6DJAG2hwqkDdxpk2tMWeYiXMscx54SaQhxcXt7?=
 =?us-ascii?Q?98p+bYTyUlAOg/VpgrTUW91JiFYLotzYolUX6ABHLRmclk9jB8XAZIYcxYjl?=
 =?us-ascii?Q?e16kZXkpDDQ4pNvrQJrbiyCT7fSIRD/ArYIrdRw51AXAQOdBbTs84EwhWqby?=
 =?us-ascii?Q?h9dqOkVWiK3YLsZwfO7uhzXSgW/pTPC7pixcKHsUuUaggvWLIElIxMtMIvpa?=
 =?us-ascii?Q?XfA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3417.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d76251-07e1-4a87-9e67-08d8f31b84e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 01:31:19.1293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xE2GM+XHzfWtL8kOoTo73yZ4KQiDcKKEwzktWbGomQSlFGakKA8pk4tpr1JGw+wyG7YZeL2rKkhoeo8TzYbQfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2444
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_16:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300008
X-Proofpoint-ORIG-GUID: 8YFYSgZukHlRZKYsrmhgs4POXrtOJ19Y
X-Proofpoint-GUID: 8YFYSgZukHlRZKYsrmhgs4POXrtOJ19Y
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300008
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

> On Wed, Mar 24, 2021 at 08:58:26PM +0000, Giri, Prashanth wrote:

> I am not a lawyer and I would suggest discussing with your legal team.

>I am the original author of the majority of the sdbusplus code and especia=
lly the auto-generated templates.

>> I see the sdbusplus library repo itself is Apache Licensed. Am wondering=
 if the auto generated code from sdbus++ is also Apache ?  Did not find any=
 special wording on the generated code in the license file in the repositor=
y.

> You are correct that we do NOT have any special exemption in the reposito=
ry like many compiler-compiler or binding-generation libraries might have[1=
,2].  My opinion is that if you consider the output of the
> sdbus++ program, which combines your provided YAML with our templates,
> the bulk of the IP value is contained in the template.  The output of the=
 program should be considered a derivative work of the templates themselves=
[3] and you should follow any requirements imposed by the Apache license on=
 Derivative Works.

>> Is it safe to mix the generated code with closed (proprietary) sources ?

> I'm going to assume you agree that the output of the code generator is Ap=
ache licensed.  Generally, Apache is considered one of the "safest"
> licenses for commercial (including closed source) and that is a significa=
nt reason why it was chosen as the default license for OpenBMC code reposit=
ories.  The generated code links against the libsdbusplus.so, so in all cas=
es you would be including into your binary image
> some amount of Apache-licensed code for which you must follow the require=
ments set out under Redistribution[4].  Using the code generator should not=
 impose additional requirements on you.

>> Thanks in advance,
>>=20
>> --Prashanth

> I hope this helps you.

> 1. https://spdx.org/licenses/GPL-2.0-with-bison-exception.html
> 2. https://github.com/protocolbuffers/protobuf/blob/master/LICENSE#L29
> 3. https://github.com/openbmc/sdbusplus/blob/master/LICENSE#L40
> 4. https://github.com/openbmc/sdbusplus/blob/master/LICENSE#L89

> --
> Patrick Williams


Thanks Patrick, this helps and I agree with your analysis.

