Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E16FC547
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 13:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFxDM4tpvz3fLK
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 21:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=OQb/rlL8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=219.64.33.120; helo=inmumg03.tcs.com; envelope-from=prvs=4863b1ab5=shubhabrata.bose@tcs.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=OQb/rlL8;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Tue, 09 May 2023 21:44:49 AEST
Received: from inmumg03.tcs.com (inmumg03.tcs.com [219.64.33.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFxCj4pC0z3cDh
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:44:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1683632689; x=1715168689;
  h=from:to:subject:date:message-id:mime-version;
  bh=Ixf6wbRyRfnSxjyuOvdEe0buPgb3KZPAoSzz88wbMzc=;
  b=OQb/rlL8VQ+E6duZJuRTfMOkIHLWPrWlLUbV5HcT+yia7IcSEGJS2vue
   FmnIf0yAXYSbtHj/928h4kpLmluOCnz76LccthcuVOo3aFzV2tANreshz
   AZveVRpfDpbYXU0f9M5Nd1e3KT0NGCOs0yj9HG2/gHjcvoJfr+SLJKxhj
   2QA5exLu9znwc2/46fWgqQmSImnvclXNikpLRjUMGhgpgLsLBsP6poKgT
   cpRlyllH4hibCVzkzGoEr9cdxIHUcwhLDkMYMO53oFLvWFuwAfyQcBmP3
   83ytZdsT/US2g84Ap28gnHgQloGz/TCPhI+um0eI7jsay2niqp23XSKjH
   A==;
X-IronPort-AV: E=Sophos;i="5.99,262,1677522600"; 
   d="scan'208,217";a="937947181"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P343eLLwH7pO/lOdqxD1pCaw0erzWRsnrmRn6AF0Qsp3sDq9OfF86h5cTqZ8A6hMu01PPJz4Bg+rvn2lqx05XdcmIpriaUkGEiXZbvubYW7nFX90TNlWHc+M19H2ahUM8ke9JwgvT2NOKAd+No20c+SyFS4vWeJ0vvGCXGpfjAP+D1nCoTuNtUrr5arcgOQmF0Sn9Jhmse5srsnWfznXR5LM/bt0BIrv6F7CvtKQ/H0UI9LSFlvsm3dnAiKeZM5ZC6jqAm5uCmIPk6Jfk3uJ+/rvCS2uPhsZQIMIXhXLoILgf3xvDE3B/gIdJbJxCJLWg36JvOzODvCQqFXfTDD8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydZ6ceABCQ4tVbMH6MqK811a+b/VhyLMTvGpYz2HjYw=;
 b=DkRIcKlHbiM5hDKqBLMxIHRdOiS7z+DpmNvlPYGyuppk16WUsnPYrjvZzsxpXsO9qaL0TKDloXqDUdyBSc/BSXdwYxAW/PWb+hPhXFMqtmh+WdlMAgHUN/AVyU7QOmtm1dpx2H5UnUsNwTkayPCDHZl1sggqpNXl7knoKvbJmS1co0V3KpDacbj2jwU3m8syseXsgHv7D4nalHOrIMKIZ1QrdE8+bC4Ug+txViP/on+R2/YAxPSkS6VloTnR1aSWI6Yf9v1+UpltZ5kUW4TPw4AwsGEgqf0wDo4NjvCfirkZCxuajlpGSAupDjPrvnVMBmeYqxcI7wWs1mjf8o5b5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Shubhabrata Bose <shubhabrata.bose@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: how to bring up OpenBMC on Renode
Thread-Topic: how to bring up OpenBMC on Renode
Thread-Index: AdmCay2jsr6KOTjaT2eZQkv8wRAMrg==
Date: Tue, 9 May 2023 11:43:06 +0000
Message-ID: <BM1PR01MB24676E7E8F7FB0BD7B71E6F185769@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=2a16739d-1af7-404d-a423-4cfd1ab5cc52;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-05-04T11:08:22Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BM1PR01MB2467:EE_|MA0PR01MB6723:EE_
x-ms-office365-filtering-correlation-id: c1f1a427-bb43-4d51-1c2a-08db50828dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6tNRJS9st7GaRFRcB++SgQYhyQA/3dYoYWjRil1qx9zxC3z3rOGUX6HOUTPRQtdxkisI7l2hnUgQX7KhfUlQP84we9njdtP3nZZLP+4asK7HYUfqn6yFi1TvxzhVw1+Qar4XwVeWfiKuFV+ABlNesGBw9t9au3OF0Ec24Rqs0lwZtm9B3wbDDz0xzElY/pt3Xlt+pdqQevN9bjEVcwtDSvO6FSkM+v8Mj3dq33BYwA1WEtZhwc3HTHXOV4hhm5ATG6ySeFXwFBEk0H94DokBNoIDVxV4qiyRCzkue55q5tXO84AG5vrn3ZRWqOPpSh2khTZv/z+6C08rPBIulBgiuVBDH5+vOpeGdnnXeV69rK95aKq7TLAYTXICgk84+OrdIccQhoacO0YnpZlxLiuqz01J1AkfJc3mAmFYo/6tiQB8bhgnGHuVeziU3ywjI8hIgGpD6JGjan5XE+qvXULw8GMWwPN4G4+R3XZm1URln1EaedX3Olljs6JMlFQRWpyZt+e5T5N9A0m+CT3Bgj5G+W8eSifFCSVN0SCA1pnQuTJqBkeLLKZNGZ2k3bi5PhC6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(2906002)(186003)(6506007)(26005)(9686003)(55236004)(33656002)(38100700002)(55016003)(82960400001)(122000001)(316002)(71200400001)(38070700005)(76116006)(6916009)(66946007)(66446008)(64756008)(41300700001)(66476007)(66556008)(7696005)(86362001)(478600001)(44832011)(558084003)(8936002)(8676002)(5660300002)(21615005)(52536014)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dsacDSdfAT6bNuUbhlMImFUgUWLk6qrb14zLMf20F74cQ3t6eKp7K5U01a1T?=
 =?us-ascii?Q?vDxWE7D0mkjMEZ4E+yI6WNkn/2aKQZPAAN3Jw1fWKDFbiJ+iNq9dbu0T34rR?=
 =?us-ascii?Q?5ra6qQc9S1rmR1YrJaH8CAUfHwGDGmeJzBjq5Ifss4mh+/ERd1dyKyR23nUC?=
 =?us-ascii?Q?DBrZbTT2niS4buMiRJpmCLg9Ab08PpiLsp/SzBqn+ExCpFAZHSLLGjdvB597?=
 =?us-ascii?Q?rddUhGE3QkuoWom9KO5mfBj/2bhzi726xfY+gXva2S+/+txdkY9QwBX4Aosj?=
 =?us-ascii?Q?q/Sbs0OiOW5y6Q4C6q4zPehO9aINDOG6+6PcgEibdUs1ocbrA0A5gwIpc2ka?=
 =?us-ascii?Q?yf7ReDbhIOQOIPscrc3JOOX/fQe9WDCxkz0dMkPWObTpDwzPSFUJ1VDTc/3Q?=
 =?us-ascii?Q?m0iPYQ3RlbWN9bHsMmp/fBgL2hZeOE16oQocOK6kiHUTfWmQWwMNydvF9K45?=
 =?us-ascii?Q?v67KW17KyZJvy0x2HqV0KXxi5ua6tUScPYHZZwHWClKsYUm5UbpIEAqgf7po?=
 =?us-ascii?Q?2EADvNKp0wAI9ziEiJ/prOanpeyDCgu5DzymG5JPH4go8CNj5Ks406aJoAK5?=
 =?us-ascii?Q?ZNQFdGBQrL3gPLLDJYmjGZuFNEUkGbzQc5U0t1Z64Ui1dT81m5YGZ3byfYD3?=
 =?us-ascii?Q?3YMEQRXyxHpDnhtqGKLe55vsVcvO9o0469Veq/UCnBLzeTN7n3n6uYXMRUo1?=
 =?us-ascii?Q?hl/gWnno52c62csc1WO+GS+7VBuPlczDaX+rwAQouofPVCO0YXJedZO4JNyQ?=
 =?us-ascii?Q?ujPzPCJaTyTFjerrH39PZ9R5gUVh/jOqJ7wVUd90AqKwePAmJb99rGEAq/k+?=
 =?us-ascii?Q?QcWPYTvR2talWnmQ9N/buVhyDuej0z/YKk4WiC8m954IoBdA7Z7GoJ6gq/5x?=
 =?us-ascii?Q?rHc/lZREBeMVmX3tw7YCMYL1rlCShT2bRmU3AiCpVkYijh4e8EThnX58N0qb?=
 =?us-ascii?Q?m9mqhidCJ5ff+qw361Ep3/ko/L68CjkoxyHfX+mLbMDYiQNSBtYzPR8Qz8Pv?=
 =?us-ascii?Q?MjXmCrF0y1Sj//HTL/et3sT5OEsTmEul+ErNFHr0s+AA1Z4hcrdULRVBMj27?=
 =?us-ascii?Q?zXDibJjnrUxjnemH94YvyNtYbz8mDT8abuTFbhdV1ZuWKa8yDR+td61bKqWd?=
 =?us-ascii?Q?hQbFQsmeQQW4sV7YU9qx/n0IgpvgpHQ8LEgg4O3BCcw16CjBh6ju02oo+HOR?=
 =?us-ascii?Q?jGUk5gWx4atGXcS7AjIIMqzTObTa88PWHkvihEQedeeKo/r/Y1mlUAEy+QZd?=
 =?us-ascii?Q?gDDe/EQ8ESZgh4Iw7PSmo2ugw8bcdi3QH5Ubsfd/RfNiTRuTcelblSN1KUs+?=
 =?us-ascii?Q?3lzJMfHMrQcVq59ejNW5fsUdSZbEo0OC+YI5xz9SRaYlCURwunHKmllxX8yO?=
 =?us-ascii?Q?MjdDmwDwmhEx8O9TC0cwWqnrHbzfxhE1jBiFJSF/9UkjS7kihwAn3Ffh8gFU?=
 =?us-ascii?Q?ZIYd567TKpGa0hYmrooFuu7volJDGlgX7oEBy2XSep+4lWNrWz0p5gVbQS/K?=
 =?us-ascii?Q?gDuvh84RBU6b/MF/k+q3A/eIdSkZQAWyoL/xLaHbLn6NBYwQicPHyLEz64EH?=
 =?us-ascii?Q?IfIGKHeHRe5btc2lR/4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB24676E7E8F7FB0BD7B71E6F185769BM1PR01MB2467INDP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0tSPCYtY62SsKERGEa6mKzwygPKDq6nxs1BItzGR68IEmkMbJFB86vdZIENeXAxB0Oyh4mWQih15X6ilq/ZWjtExENdL3xjOtUHPj9SuDuyMvhE/FqSSPlnt9dsi4vQFwb5wAx68qmmAR3bgi5ZnWYupbb6cvnZuDFPccFdXWJsQwBrjSI2uwDmK1FE/BW2WdFD1uoNJlXxwBrWufzo5gDciuYoJ3yMWWiMM8el17W62IeOPo/bvUCt0dI1eUqQreNlB7i1gpVZ7AfyavpTZV9n36eclW0Q3kHleL/l00sP6iEdUGCS5eOk33/d46pv2ChCMWoAUousrlkFF17g2ibOzs2kodXN2kGuuAFdF3JJkY577GSX92PiUsrTnfYl+8q18qVUx6NYjZN/7OGXZF6GPokMmdkAVcJD3wF/oFF3oEaiPvd1138T3ro7+Lm0NZRc1OFj0V6DbmfbuksKVtcCLc0t/SL+3xp4R1T+zw9vJqi65BJLlsWkBiEx7hjyIvDwuYp9lsJbIloCv0IltBeL/mFFxN8pfKUzl9Qj97+14tZqSTaMYw/9/7+6yGTg5ktnCDxUwZ/76vYi76rMD+3etA0afwS6YUqccjSMhzCly5rYfmJquElunVE+/uFR84oElVvw2BQijqb7lEgbq8puxO98FgYVG0wUIbRp1jekSMUs5Gw3txTqcGmSxI2b/G+9iVwTNZ5C2u9QTtVx9mZsm7yOEQ+i2srW3zlqOk/iwsH7CaynjymCBO1k+D6DencRf1waVPUDYcXEYUMekZk8q0TOsvE6soHGTuh0Pvf0=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f1a427-bb43-4d51-1c2a-08db50828dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 11:43:06.0569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWbyXRO2C9KBVJPyq/Bm7gJVzwmJNKcSQ0/zmMvj297j+G+01UrmSo0S85ecabgV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6723
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27614.006
X-TM-AS-Result: No-10--8.698700-8.000000
X-TMASE-MatchedRID: agG3y/QMcI9haj10i6TXQDCj6xe3SuezDEczNloMRyzkMnUVL5d0E4g0
	83cMd1BO30RKzSLs5yT4B5OWeBgklkRfCdMIZ+bd/Sl5cYQQGW8O8pJojG7qSkrRZP/NcCCSA/O
	grF2/7CZ25EU7uPgfTTeG2Vt0Th9t/7PvFa8I/I/Mfp33SZvj4o5UafLmrvaGI9L0l0rdbj+0CA
	rhO1es/eAmO6TkjG+lDL6+XjCG+Z2SfqUTJbyqQiI9MxSOQ6CSwl3hycCXE/auMXu+rtfqiDIC+
	Chl1pbPEoEzw0Rp53VERx1dh8VJg4kvS7K6jNP9ZjQijgrFvzrKIGMaZvT02zssXelfet1UuPFr
	kRUFXWri8zVgXoAltj3qzHKAhsUY8dA3q/uj/L/Zs3HUcS/scKsQd9qPXhnJ/4rWvpj9Ucj026r
	yIwO9bVCzlwOJLrd83FENEi+/uXoXKsZk/Kpv7k0aWs/vhiJEWUP4Bi7CUImBbsfxEXh0o55RpJ
	lblLbn1YgXURJ/+ZUqKAHuRowG7g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.698700-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27614.006
X-TM-SNTS-SMTP: 80052DAFAFD48B0C363FC3373C2CE7F5B17350950754F07AD375D892302745452000:8
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

--_000_BM1PR01MB24676E7E8F7FB0BD7B71E6F185769BM1PR01MB2467INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hello,

How to bring up OpenBMC on a Renode Simulator (https://renode.readthedocs.i=
o/en/latest/introduction/supported-boards.html) ??

The target hardware that I am interested is AST2600 but looks like its not =
in the renode list.

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



--_000_BM1PR01MB24676E7E8F7FB0BD7B71E6F185769BM1PR01MB2467INDP_
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
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Left">
TCS Confidential<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How to bring up OpenBMC on a Renode Simulator (<a hr=
ef=3D"https://renode.readthedocs.io/en/latest/introduction/supported-boards=
.html">https://renode.readthedocs.io/en/latest/introduction/supported-board=
s.html</a>) ??
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The target hardware that I am interested is AST2600 =
but looks like its not in the renode list.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in Advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Shubh,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_BM1PR01MB24676E7E8F7FB0BD7B71E6F185769BM1PR01MB2467INDP_--

