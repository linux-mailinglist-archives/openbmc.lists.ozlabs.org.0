Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E754C5FA36D
	for <lists+openbmc@lfdr.de>; Mon, 10 Oct 2022 20:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmSLL6518z3drf
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 05:36:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=QPkvjzHl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=121.242.48.116; helo=inblrg02.tcs.com; envelope-from=prvs=2759a88cb=shubhabrata.bose@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=QPkvjzHl;
	dkim-atps=neutral
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmSKk35Czz3c7L
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 05:35:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1665426971; x=1696962971;
  h=from:to:subject:date:message-id:mime-version;
  bh=1YqXR3frcrnjXo3i5vY8DtogNOrCCCXjhhqdNoSoNhU=;
  b=QPkvjzHlVDo93Dq9qFByqp5q2ZAnle1PsfxbXn+nqLAq78BJiv5zU5zE
   NOf+jKbkAV7xi2mR/MluwxV3pv0Sdk2xEOXJegHixlfbSXN2lchdfeuUw
   f1UB1Xc96iA1RquEVjtTapFzZa5hvuMqzylgK6mMIX6m8gD3o16++HFSm
   XArTRVcoWodRP1lzkmfEaMj7DW7F8BOZwUKvBGGOcLA9+4g9BV7jX7nEa
   H9HZx7sWjAryOqXYVds8zneH+OpZPC1XCPTYiDgy6IV+b4kl3YT0LV7xy
   VGrgfhhf+/zlHygvJMYT9GY3Ac2yxBa8JKBUNe6xF3cnccMjr1ozWRaNO
   g==;
X-IronPort-AV: E=Sophos;i="5.95,173,1661797800"; 
   d="scan'208,217";a="117653704"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9bxc1QjXGHautay5/rjVI3C9hF+haYo83GtYrk9CxqrZxA5rS0RrZAl4Ba/rOqxN6TSmFuMzBfSp1iqhK4h92D8o3QToa9dL1uj+tgkANCSv4lMNgqIFOOY0Ql8vez6LioWoXyzEQaX3U1tfVi4pwrKTQJhgg94VYU2u7/16syoei5YgDtHdNdMOEB6b0/C3W3fHeL9Yk4FwqpYCbp3M1+WLovN8tyvHL/3Gsa9Ks1WB6+uwWGRCu0QXpeA8F5FSPxfJifVHIFFkYSVPdJ2B84jxalB2o5Lf/sCSOTcOaPBp+SvMJEBACzfCvxL36jW4138R6te5Lv9/CLT/3d1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BwDH3pgstIgciiNCIhugukKEZ3SwqX6j50s5hPxcWY=;
 b=Hwk+Bl7wpL92UX3sX+yLOAXkS3Aa+oT8q4Wzd2ugtpQxEcg+xjo90qBFhb4sDYMvkdZUoPWTqrf3rhjQVphDaN7BRFnNTt+Qqfy4KgDUGOWUWAp7XtgHZVg1EKWjMAYp4BIfCUW0nO0Bqj0/dF5eRY9WzXkeN3L6Zby2c4qyGEeU8WLHPZ94pt32fs2wWGXENBsqGcPwe4Ga6SdYB+mjlfpsRYMYiIJr8HC4UDkhVjM6tsx59M9/h1bOoDSIWkclsIIEcbF+h1wwf2KXcIgybUFe58/3nMpLxfTVrCCyJl37UfeXRZi3+kpKphqPbtgAvZJvdIDby8aukbzOnyzZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Shubhabrata Bose <shubhabrata.bose@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Unable to connect to a BMC Serial Console 
Thread-Topic: Unable to connect to a BMC Serial Console 
Thread-Index: Adjc1ncA6Xvl/rzNSgCt2UOHebO5gg==
Date: Mon, 10 Oct 2022 18:35:43 +0000
Message-ID: <BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=1fa50c1d-4ffe-43e0-9188-68596d846227;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2022-10-10T18:22:34Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BM1PR01MB2467:EE_|PN3PR01MB7646:EE_
x-ms-office365-filtering-correlation-id: 4d9c447c-ed5e-4ff0-4de2-08daaaee3d88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IGaRdwpxtmuYJwKqiiq2CV+EQ3NZvoOWKQJDOUmMgsIg7FeY/+AkqeUt69zOsKy2ToaLdK4HmOzZpaQARiIWGL0nU//BsxBT9LHB3HUdxxZymlRulK/JOmTtWXgKQChpSSz0nEq+bEukPYUB29IlnpZrommTdplS2lfq+Qqp2296Ds39IOcBdDgyanoUEBYZm7bPJAQVw7lxwzSppkg8V0zNPmrTcteDnZCbcwFUSNhEzf8EamjlpqwHweK3cFggWzsRYryrunlCE8aTmLe9grvFdXgaJtbDKLBBaK99x6MY5MDiMTE98EDox0242LJfezBm1FyKhStFfyhqIiSBmqfbRdiuPsMrLPbsIZodENFcBmF6uoeKrMP1bd1VJjOODYnNKDksdYzMhK1Celuj7WrlXvtjuXZz0RwZ39VjF68qlgvdk82FljdOVbwFJ7RLxOvNIJhVPLDAAMQpXtD9E38BTESjXWg1jf0MziKNZ9ck08v71iC/sDcRFxjy+vz387ynI6t34PGoWmEE0HuG/S1f3PiuOq3iUamIGqXxjtQaew8OySjvxilk9iiyHRrAx0xWYe5zZuuSOGyx4bq4MMhovSI+LzkVv5X6EnJRQlAmbuavzkrUtACDlM+P4eeyYC+8lchLSr1oXpO9Kva6KiExlIWkNwYfXia6CzNe555VDMMMyPJGgAGLUoW3s/i+wm5d5rFhZF+FBqskHHSuJV5ZDTzzaEAcCxDZV0SgTT7TYoqcCdECoY54eqVLCJM02JWxeFH5KyOLvNqfQXgKsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199015)(66476007)(66946007)(26005)(8676002)(66446008)(7696005)(76116006)(4743002)(6506007)(64756008)(9686003)(66556008)(186003)(478600001)(122000001)(6916009)(66574015)(41300700001)(83380400001)(33656002)(5660300002)(52536014)(38100700002)(316002)(4744005)(44832011)(55016003)(82960400001)(8936002)(2906002)(38070700005)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0i9t5cEqsz9d27lkn19betNPgjeO4rOyPX6x+DDoX6niGF7scr2fqnjwmbmD?=
 =?us-ascii?Q?tX83FhbQpNnQs3leoHqszpqiN2TOAbkEOx0SfGKjt2jRhJe8ZRyaRDTy9SdL?=
 =?us-ascii?Q?bPv59nnh/uCzg7cUs2maKiI1hhTO1ecFmT7OIycJqJCGRjqeGzyBNJLfIWB1?=
 =?us-ascii?Q?0t2NqGUwpuRXw3NpnFEVyJvKFg4w/AqXg9c+tOadrB4np5eF5azfsef2Oc+t?=
 =?us-ascii?Q?wDVh2qpmP/Eu07MTLDe0B9EnXGsLsExsWjqlE7eUu5u9DnazZgiFG3sLi1kY?=
 =?us-ascii?Q?rXKashDtY4uNEtdvOm2sZSWV4Eo11mB2eIY5bLF2HsD4nXaOtxp+AA/YJI1L?=
 =?us-ascii?Q?lgWLI6/HqE2iachCEhpCqR0PNHoJPfsmWbl2k2DLYdgEix8bBke0YvsLc1nd?=
 =?us-ascii?Q?Wepw6JJ1ChNf54DWVuqjmKeYm7w8jqM94MK9I2zT7Y4IuL6j7S8ofZ8Kmypq?=
 =?us-ascii?Q?2m2oYsrxmcuUs+7wxo7WcCL5aNx7vHkOHray4l5xmfZ1U5BbY5DGOSNG7vZj?=
 =?us-ascii?Q?vfS0OwalTKNO3MkC++Sf1uZjTcx8HPkrtXQ9fATlD+jz08DEHdne4RIS9kdA?=
 =?us-ascii?Q?kt8DAwv/TFmKyyZ7YiglPIiBO/yFjZE3+7/1Cv5lVvtm6yBx7tJ+7bsyY3JV?=
 =?us-ascii?Q?zIZ35MhCczm64gAUyukRETvHAz9csY9EbIOQLFB29E5c9Ueysz+cBnXeuy5Y?=
 =?us-ascii?Q?5yTU3jz50Vf1KdFHlyFg72lCpmLw5jz+nXj1v2/CgorRH8Ow8elQLoBXrN8L?=
 =?us-ascii?Q?/rJ+JAN7byHxL+BIdC85TBHy4cdfNde8W0XgRNjjT43NPwKByGNuXLfJjjNv?=
 =?us-ascii?Q?EQGsLDXKLaY+lLPfj6Xwo5ngFfhWV26eBQJE+cz5oREtX34dixU5EDGAHVOy?=
 =?us-ascii?Q?H0WdAfRLyA+wsXvZRiiLgyQCTVlxZ8t3Nl+cJjsspLLsjBzT80gSuJsbBzL0?=
 =?us-ascii?Q?1VBe+9Ok77xwaWBNq4BvIcIxohtwOzSqoT/vCFzG88ZXBab0KviwqK/77ivn?=
 =?us-ascii?Q?wC4v6ZsQBkrJTuN3tQQztFVCXxF14qL+ORv1KdrMdj/PF8MursGw421TO49P?=
 =?us-ascii?Q?s2fWw62/tbHDDwfH0iAcXsAd5/k1+k1AaMqTFHRPEBGi4kYAlDLkR5jRI4/2?=
 =?us-ascii?Q?BN2uEXoCExOkDXwoAMN5fau54DdDRqd4LoMJQLj3OA85KeSY91CEBargolEN?=
 =?us-ascii?Q?85trvh+tp9ZYZ+GEXeSeGX2bog0Z5S91opweDaKMu4J0V6Tf5seotLHLVwYo?=
 =?us-ascii?Q?dIAUha3apNbP82uOhn8vmMI3r3wPiRRvoGF/hW7HTXS3VtDDg24Jq8StQvta?=
 =?us-ascii?Q?MSQ+Tv/Ix74QVHqzWsvq4D6mAEiUPJQxjaCcpHhu4dK5RWczb0hFUifr4doK?=
 =?us-ascii?Q?KteRFiq9obtlTFq7IRvXXlh1VqtZsYK5fc8mB5ymGubgD3ATpEW1IN4HR5Ev?=
 =?us-ascii?Q?GOJbADqsg95emwm5eOz8o9VcUlTYBvJu/5fHG3N2Wt4BesqmI4hFAdDUVSZn?=
 =?us-ascii?Q?0QiR+Q+v1M0VR5ht4iAKUQiTrYl6uJzqbUvz2UmSRVcXLYGIa2ZQI+HAAwVS?=
 =?us-ascii?Q?MVKsC+/dJXZdMfO2Cqg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB24678016E23DB9B97349C7A185209BM1PR01MB2467INDP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9c447c-ed5e-4ff0-4de2-08daaaee3d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 18:35:43.7315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9QKbKe2yqHGPGF4DFxXFC7P8D+l6Bnz4PbREtOgWZ2niiaPZ1B9aidIjaKgbFIh/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7646
X-TM-AS-Product-Ver: SMEX-14.0.0.3031-9.0.1002-27192.007
X-TM-AS-Result: No-10--6.752700-8.000000
X-TMASE-MatchedRID: NfTIw3rIsJ636bWU2xVUigrcxrzwsv5uTSz0JdEAJbTn3ZLCt3rRSUbV
	C+F4n057RK+aQoBcn7x2Jkar4NzRGAzijwbEm3oyBcaL/tyWL2PxuhkRWK22GMOo7r/xHr1AyHI
	9pvh+9W+AwG2maXQMIEmlX2scVfePszCdMqCRuw7BtFDYGmaWKhrL4FDGAJ+F19XEQ+nuD+SxSH
	46Ro6Gl8J++jdSAUUkmkn+IZ5EwVA/sDqabNSyQIDcpVWyPxAMxoZTHZ+XCFEYdZqQlzVQvG9cV
	O2+AmYaYuZ5YtjU2X2CUw9o0jKgrCFPnoZPF8oHexrcsu+ObWeu7c5fJ+HSAHYoMTAHGn1ahQH+
	YspUfFoYmbFYWrixJ9kECb6eFouAavaCW5zqiNqB381iZ59HqLTxnpbCjruIX9MlUXqFTO3lzh6
	9aihYw4A+zZbAFdrS/76CM4Z/MGblRxm3A2wKuv7E6GNqs6ceph2ujy3dRBb6C0ePs7A07YVH0d
	q7wY7up8Odl1VwpCRqCVxRaQi8/32zTDcz9gn9KB3FITjK7cyzYxBtlRiOwuhPL2uhCZsAjQAJQ
	3/0B4/I19amroJWGyDBQY5+nKCVvGq9H3rKEdEJK2MK45H+GA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.752700-8.000000
X-TMASE-Version: SMEX-14.0.0.3031-9.0.1002-27192.007
X-TM-SNTS-SMTP: 86BB392E8B576EE864C45533CD336FA91229FAFD499E6052C24C34235CF9CDC52000:8
X-OriginatorOrg: TCS.COM
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

--_000_BM1PR01MB24678016E23DB9B97349C7A185209BM1PR01MB2467INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hello Everyone,

I am new to OpenBMC and I need some help about how to access the BMC consol=
e which I am not able to, after many tries.
Currently, I have connected my Host Server (i.e., Thinkstation P510 - Intel=
 X86-64 CPU installed with OS: Ubuntu 18.04)
with Intel Server Board S2600GZ (OS :Ubuntu 14) which has a BMC chip using =
a USB-TTL Serial console cable
("xcluma Usb To Ttl Serial Cable Debugger For Raspberry Pi Beaglebone Cubie=
truck".)
The minicom is not showing me any prompt & it's paused; nothing is going ah=
ead.
I googled some websites, its suggested to disable the flow control but even=
 that does not help.
Are there any other ways to access it for example web interface etc. or ser=
ial console is the only way ?

Thanks in Advance,
Shubh,


TCS Confidential
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_BM1PR01MB24678016E23DB9B97349C7A185209BM1PR01MB2467INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
/* List Definitions */
@list l0
	{mso-list-id:1182938688;
	mso-list-type:hybrid;
	mso-list-template-ids:1739611000 -695830272 67698691 67698693 67698689 676=
98691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0E8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Left">
TCS Confidential<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am new to OpenBMC and I need some help about how t=
o access the BMC console which I am not able to, after many tries.<o:p></o:=
p></p>
<p class=3D"MsoNormal">Currently, I have connected my Host Server (i.e., Th=
inkstation P510 &#8211; Intel X86-64 CPU installed with OS: Ubuntu 18.04)
<o:p></o:p></p>
<p class=3D"MsoNormal">with Intel Server Board S2600GZ (OS :Ubuntu 14) whic=
h has a BMC chip using a
<b>USB-TTL Serial console cable <o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>(&#8220;</b>xcluma Usb To Ttl Serial Cable Debugg=
er For Raspberry Pi Beaglebone Cubietruck<b>&#8221;</b>.)<o:p></o:p></p>
<p class=3D"MsoNormal">The minicom is not showing me any prompt &amp; it&#8=
217;s paused; nothing is going ahead.<o:p></o:p></p>
<p class=3D"MsoNormal">I googled some websites, its suggested to disable th=
e flow control but even that does not help.<o:p></o:p></p>
<p class=3D"MsoNormal">Are there any other ways to access it for example we=
b interface etc. or serial console is the only way ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in Advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Shubh,<o:p></o:p></p>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Left">
TCS Confidential<br>
</p>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_BM1PR01MB24678016E23DB9B97349C7A185209BM1PR01MB2467INDP_--

