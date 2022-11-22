Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A36334D2
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 06:51:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGYK427NQz3cMR
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 16:51:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RxDqoi0f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_mkurapat@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RxDqoi0f;
	dkim-atps=neutral
X-Greylist: delayed 1097 seconds by postgrey-1.36 at boromir; Tue, 22 Nov 2022 16:50:33 AEDT
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGYJT32Nnz2yRV
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 16:50:31 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM4v65N022186
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 05:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=Llo2sqhDl7EBOWQMz9NnbT8wCXhWI96+JVtalbD4iuw=;
 b=RxDqoi0fbvB5TZOwQVDt8Kt35C7ZT32Bud+MftIf1qQqGPzs7ttYEEQtoaPgTKhJV2Gd
 fOqbvxkgJupVyxdcI52dcPE9IvVryiy5mmxGV5cCrIiPNRvSPpSJNf9wA1Flo4kjPohq
 x7V9coy7av9yEMWiDZjbfBtwAWBjEH497STB2+DJoCtyO/GpHQoseGKTcdzYf1JwHKOF
 j1ha75oeMnb5KAA0IP910d+wIaEjnW247KC9HcaaynhyJgrPuGVcuB94B0jQndkDzacd
 EnynG6rmTVJ9KfRHNDi8/dAbL9y+5X2+f/iOo54c6Hou59OhMPMm+s30KQ9o+obFQr4u 9w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0ptsr5jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 05:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiWMySlFkZ+51MtANv9GdG1ETmz9wEVBNR5ASiKgfN1olqJaTcTvuX2FEuS1pw/TyqZfGBFCgIrpGBU5ZBvocFQj7qBg7G+7iUK9Tl0jOtXxKgfbvDhtXolqueYiMit4ayL5y1pBjleeaqK5Gbi+vxrLEFUPpSlm6UyVIIQl5WvnG/ED/XhjWNmIb6KMiqPtWntocRJqP6gRGhKTQXd3hEKUVj1TacDgfj/YfM/Y88Qi4sIo9fNlrNt5AMizAfeBUxcn6ae/WNGHqWdy19fSu9e1DzIknVYrRnD/V3OkGJJ06+cJlpt1lhia3zHvdTlSMlBBF0MTkXwrGjDD4ZVP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Llo2sqhDl7EBOWQMz9NnbT8wCXhWI96+JVtalbD4iuw=;
 b=c2EYGeqWx0VoOCTqDmQ7aTv+wx1nkb5pWsNz9sPK9djOxRorpwZw4Y3v0Pgl8wj9q0/pPSIFp+5/N/i0QNUdI+IyaA8B+igqXQ1O6uwUo+uQbPvvQu26VmG+cxLGs+6l5Vjzhs4qCVS1XrUL3+HwWDhNUjxGmJjL+lH7Cgn0rYHI7G+ZJVuF0R/UCeD1uv4Cqh02xcgBOh/vg6gPkXAPvAcJVw7O3q2oaNdE4I3kZfJ2PHB2S6OTNIZc+sgC1Vesl32QzsbabxMbCHCc7WrEybm02p/WS682ZOxj4ESXE1Ds+llBKORDOyJE36yFxfEstFFm1HvfNQ3Rq+kiF60UGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8499.namprd02.prod.outlook.com (2603:10b6:a03:3e7::7)
 by CO6PR02MB7537.namprd02.prod.outlook.com (2603:10b6:303:b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 05:32:08 +0000
Received: from SJ0PR02MB8499.namprd02.prod.outlook.com
 ([fe80::b303:b60a:249d:4793]) by SJ0PR02MB8499.namprd02.prod.outlook.com
 ([fe80::b303:b60a:249d:4793%3]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 05:32:08 +0000
From: "Maheswara Kurapati (QUIC)" <quic_mkurapat@quicinc.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: CONFIG_SGPIO support in u-boot for AST2600
Thread-Topic: CONFIG_SGPIO support in u-boot for AST2600
Thread-Index: Adj+MfrtAhhXybwkQTe+b8FFXusWSA==
Date: Tue, 22 Nov 2022 05:32:07 +0000
Message-ID:  <SJ0PR02MB8499B06E6933123E9765871FF70D9@SJ0PR02MB8499.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB8499:EE_|CO6PR02MB7537:EE_
x-ms-office365-filtering-correlation-id: 187c826d-f04e-4030-dc3c-08dacc4ae5bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5i71IaOeB5cedb/QrTV2CLnpdy2PS/+0Qvq/edEjlefMYjoEIvl+3a74K4xVWIXbxutnxw3QwpzQB9Sv1fc9NUS0taXcBg/JGaRDCI3CWwXEwQnKuhpC5ZUV9wmyGWT6VdFn3N9Ds4avUjSb7WqoNfsgAp1icLm6HkdFEtFha2aqiCD5jqxNs+aNHm22bTRwMIPpqx2PeVNA9H6i6gWDUvKL37WAMepqqCYRTcDGjlsHigMX8gAFG/z+WT6uuPDXdubhP3lMwVnW9yRdMw5O61+yo8uMTUVdn/oPqWn3fLMLJl90jmN30FvcnWVbXrx57bqnh3DCAjr6y23Y6CxwMVT9M764TSRsSpBzIK3n3wam5IZFciQR8I2lKz/basjtjUIfaTWdFJCFkw/cqMPSW62Un9YiU6I5xJrBeFWg+Y3Uu99Tsl3rYnVvD2kxSuvwzEooj6DfBo0ZirPgmF1fdHlG5Z2AmDqtY9kVd/Rw4AvTPY8Il/Wsl/9XQcFjMFx7OjcpVuh97epATK/VKI5JqjBe2p+6QGgWvJibRjWAnxcz6zD3xxV5aV+S0XWOxmzhRC+elhjSzmyLV7exZP2NR1o3cGWeMDe1vOOkKjkiF1gE/KJh2kbHEatEtbJSWjQzZNUN6ihhoYsvdpiBhb0bgYpG5y83x8Okf0CnwZbfziF+gC0dqQkOYm/UIkIHzmYJS5lH18BHkaaEsgLbBBGWbJ8hqaNODAw+ZBnDuY1i/pM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8499.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(2906002)(33656002)(76116006)(66556008)(66946007)(55016003)(41300700001)(86362001)(66446008)(38070700005)(7696005)(166002)(122000001)(6506007)(6916009)(38100700002)(8936002)(52536014)(5660300002)(8676002)(21615005)(64756008)(66476007)(4744005)(186003)(9686003)(478600001)(316002)(966005)(71200400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?EvTJkKYp28q5akOuuIb68qxc165SO5iO2d+WqmgsojAWfDNt48DOYhHk0PfJ?=
 =?us-ascii?Q?o2BIpdI/psdaO4qKzihQdJCnDRmV1RulDv0HY9eLJB31fcvGN4mfqrT1TtiW?=
 =?us-ascii?Q?ZO7VIIBnRsB6P2YyNvVrsr8D60O6lqrGWPPHfuxPvXUXL8L1Bdrh8auURSbS?=
 =?us-ascii?Q?8/zJOLxrS3gIiT+Ijo1ybfNH2Tuc3+7XqWojSw31dfOkJLKjvgBZ7558eIzq?=
 =?us-ascii?Q?o4eWzIGNxcigWRkbGIup+9dhg94z30NhAJIGY1u/TPGPfI42sNzzNPk+VKU/?=
 =?us-ascii?Q?cmAM/ueZ3pdpuPGO0zo3mGw4ebLl5mhzVnDZAgSD9IiMJ171uGfR/WqfdpWs?=
 =?us-ascii?Q?qc5WSyGXhXRpUBFoPG4AbYSzFlW1oFPmfHBTwNSE+wMXclfROQmyyPXGAmMp?=
 =?us-ascii?Q?MQhssgz3MhpfyiwuBDAlXtJhxsjybmnq6vI10Q1gdBQwB38hrkD8mpq5h47N?=
 =?us-ascii?Q?gRF+yLpGezjnBn1trkSGDVfObqvnD90kNGXDUjA89qyF7sK+zBAnDactpuKm?=
 =?us-ascii?Q?4ix2WV7ea1UktZkGXjssmhObIIncl4KTxXM2M69vbVBFd6ImJsXmQty7d996?=
 =?us-ascii?Q?22FMOB2Ji7RgzystDFmcB82YhBHRSjokXnm3mHiIchpB8gmVzvhL+RXAQDXq?=
 =?us-ascii?Q?xGZqtdIrT0bBOsw62J3lRXteK9NAN5lrYQj2Yn7bzGCW2zzePvLO0tIY60Or?=
 =?us-ascii?Q?4sw8Gt9NclncESWFIRneZkXyG5SDiKqOUHn5IB7W2ivjGvS+blBgZ1WnArpw?=
 =?us-ascii?Q?tCBiLLmevJuzVffCwEP0+ZWuEsSe/vQsCE+S89V2d4AzgCGU9eGKYmOAJBO6?=
 =?us-ascii?Q?cHavkGh8fNNGtDiTNa3FUwKN9OYBMt25/ydx278A31e4/KmpOo5avM6jeVva?=
 =?us-ascii?Q?pct/YQXx8Oa/vxniwvbcqZIb9legbQSSSW9bcuxln10u+/MZLTOoY5R4cxPC?=
 =?us-ascii?Q?QKK2EhqOZNDIcm1qkrRxI6XDFJvtCNT/z8OHtVVTuZyJEhZ8XLuyJtB03Cio?=
 =?us-ascii?Q?ZZryH0zdkHEpbqVvD7Tt4qfeHr/ptVvFkXrLIiqRsmnNriJeSE5Ar9M2K2J+?=
 =?us-ascii?Q?ZV1KM5uXiiutJcSO+ojyAne00PKFMq5hI7OB1cV8D3SzT5lY7W+83NBHRYxk?=
 =?us-ascii?Q?XTxLCtNqQk2nXeXJ4t1zfpS2niE7bgOlkH4BBDFhn8fOLfZemxp1Q0n46eKY?=
 =?us-ascii?Q?B2NYE8hejdE0sKyU/yKmIhYSOwQ3TJRQvgriV+3mRC3lUqgOAZjFqqQBK2Hu?=
 =?us-ascii?Q?+drgem+jOxkOEh6SjknTjmIUSybXVMEEatoEV+qNMRnmoe1qNjGq07buifCP?=
 =?us-ascii?Q?UKZIcpdsxbr1WK69QMwE6dXFL3cT42agllMJdwQheJmaQTiejA84OIPpfyQ7?=
 =?us-ascii?Q?CP5F+AXFs7CThc21fc+RFqVDSsH7j0F8h2MIejVWBZnNz8MfJTxFgOsPUnHE?=
 =?us-ascii?Q?13Tw7EIPkLIfhp9mRUSZRAif4yzbZjCAmZXghwPj1K2F6y2CdXqxMHWi4/eE?=
 =?us-ascii?Q?VA32ya+50ShYDRYXsrhDuUhKd4Eza9pVQRvFINzVt0Q2a7BsRSCjquOnpLT6?=
 =?us-ascii?Q?1qvyl8iGojENrT5UcPvKMGFg8End0oqsjhRMJMOo?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR02MB8499B06E6933123E9765871FF70D9SJ0PR02MB8499namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	acgsyycbUGweRrS0UHvy/0lv+ZJC5g3TYYzZkqmGtpcahAF2qvrO5/TFzO+72NyIgPnfU7VBayDwor4mVtwd0BYzRoxdNW2OtqNMC1WXfvr7PbHQyr3UHWyHh4yPyuUh/x2Za1zrqRtsmjtUiXpwv/A/hAR7O3e9uVONnPd5gLNbyi7IWHcGpTE5LSirDm2LEd/NJLeKnc9j6+ZMsl+K3+QwXb+6h/Zw/pgkTZK8SGTlKy4Illev1MTexFe6fBI3kCoz3OhknEfX3/jTCE97S+n+wAnUDEeyidx7xSc2z7JYIKiVJVzSijK/zfj+ZmC88VRHwbuGqRzR77aFnueTieoxrqW2y+sRXWdxVj72vU7xjnmJRx37haEg3sVHEIDCnY5Ik7cawDVghx2UURtQMHLhlIDGYUOAQ3dCEfWJEfA4LR6lEaGBi6bzJ4yDvJhhB6Q+Gl+1GHlQcjhUhfFm6qYAG5E4H/CvOOECtnLfB9zlbkv8mfQsjicTlcMvl97GE2xDhcSGmiVsaknq9X+1LVMKKlGmQd3RX7Trh9kLkUj5qzkFj6adZHUWB46+wwVO/O9x5BFkMLSf8pm2y45UlC8KP+mUWrOolUejxVw3clPZRGVIDQmzWqqRbe6ch26lw4VlkK6I+UiZG5FgALvTU1jk94M8hCVmEjiq3xxKHuRwJWd2gUVqZTAV2I2zEmh9LBid+IN4o+6HIpyk0i3SI5vE/noU01wGdd5iYLZTZCis3YgzhM+bquehuJ9loIdD8LqD8PraC779vVfO00iR9qgJVLJcLSI+ZOcGy65Iy7A=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8499.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c826d-f04e-4030-dc3c-08dacc4ae5bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 05:32:07.9974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoqcjpTHUIatY0auxbqBvemzsn3ClyGlJFwyuvqNoxfbU2Sz88xeTev+U7rCzp2TeC7IPW+WH9XwgmvwJPd2pTJW2sIV9irwc8AVcX64+bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7537
X-Proofpoint-GUID: dcXJd0zkX-1vLPwFbUXsk-QfUMLigMkH
X-Proofpoint-ORIG-GUID: dcXJd0zkX-1vLPwFbUXsk-QfUMLigMkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=604 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1011 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220039
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

--_000_SJ0PR02MB8499B06E6933123E9765871FF70D9SJ0PR02MB8499namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

While looking for SGPIO support in u-boot for AST2600, I came across the fo=
llowing patch discussed at https://lists.ozlabs.org/pipermail/openbmc/2021-=
April/025616.html.  Looks like that patch is never made to the branch v2019=
.4-aspeed-openbmc branch.  Is it because it was not tested on AST2600? I ca=
n test the patch if that is the reason. Please let me know if anybody has m=
ore information.

Thank you,
Mahesh

--_000_SJ0PR02MB8499B06E6933123E9765871FF70D9SJ0PR02MB8499namp_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While looking for SGPIO support in u-boot for AST260=
0, I came across the following patch discussed at
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-April/025616.htm=
l">https://lists.ozlabs.org/pipermail/openbmc/2021-April/025616.html</a>. &=
nbsp;Looks like that patch is never made to the branch v2019.4-aspeed-openb=
mc branch. &nbsp;Is it because it was not tested
 on AST2600? I can test the patch if that is the reason. Please let me know=
 if anybody has more information.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <br>
Mahesh <o:p></o:p></p>
</div>
</body>
</html>

--_000_SJ0PR02MB8499B06E6933123E9765871FF70D9SJ0PR02MB8499namp_--
