Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E1644E10
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 22:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRYk31Yhxz3bXK
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 08:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=VNCe2eSe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=5339b91acc=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=VNCe2eSe;
	dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRYjP1jkWz2yyZ
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 08:39:51 +1100 (AEDT)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6LXvWB022910;
	Tue, 6 Dec 2022 21:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=LZ2mo8YHcDevb5yA2RUZaEUr2/KWf2M7Y/iTrJEHRNc=;
 b=VNCe2eSenZQifulf9o/Kb0Cd+PgAAHK93gIL71O0/HTypzVI6tidFyNd8rJMai6ryhwO
 2bWK3bshuAQu4KdN7hDXuwgbm9STaV65q5M1dah/TZyundY+EkjDcbgePiYfvCUtpOTS
 pomULpnlUtYHq1+L1GReLfqjpBdFn5srbwnmj+dYAQ7io3Dj2FaqOeITOZ8ka+/ln9+x
 zC+ZM/k2neKrE1jv1yeSKJRJAf7aU8JIiqPUaNyyOO+FTPlxLt6oS7veAXzF0ewO/eA+
 GpR72x/tFep1ORugZEI7jFzghe+Zo5R/l3L02Tg1LZbkTDUzEX4un2pev5Su9TRdiXf1 fw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3ma8jjs6db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 21:39:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATSO9YVUOhirqJ3ngSsSweFouSfQD6yHvzPIvGXMlEFieTw2dZrgBX3M9Qko80+H7S1N755cX8/h/a5YsemIDMF9ZC4zR+nPHkU2NfyQlrGLzDcXNSu/yvJNDS/6t6fLRClFORG7xnVec3VEIJq6ykEHvLjmoVeV6y4fRTOIU+jaEGda7jTPP1Rp6jM6jnJf4RoooT2oMZHxW9Pce4i6ZoUY2i/OYBPcRLxU+vkhJJR4Niq7TOXeraN9koECfBUmUu1FvGVnbtiBkwftd+7reruotxjcMn4PlP1gd9fOoHra0uxiiQwl4y42yBwUs+29AcOQt1zdSEoR2wmHhqKczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZ2mo8YHcDevb5yA2RUZaEUr2/KWf2M7Y/iTrJEHRNc=;
 b=Y/6pJ+DZ2hTj7ODSV0euIxeVMyuf56wc5OHK4SoFEYFycgQxCjBjRf7MRT2DDhCi4qybPfOa5ODu37s8iKNyE02BktFas2WkxsluGWiugQYcStqiDtyNDKycVl8A1IrxzEPZ40ydIY7FodkkOocqOs1KWIpUvrDVo6+KhHtZspKCMrJjqkqHri5rkdwWVJ2JUVMdAoyryKfhVimB7kEPROWpQoL9pF0mxSuMs7G7OIFuEI4v3MNOQAhqeaqsW6IhAfVNGiRqrCI8fFwSFI9rYKzqVKxJa4kvo2uQ698EFKPbEi/er5G7tGmMKHS8xeDEaQ69Qq1Op32dS985a8AfDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BYAPR04MB6037.namprd04.prod.outlook.com (2603:10b6:a03:ef::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 21:39:45 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94%7]) with mapi id 15.20.5880.013; Tue, 6 Dec 2022
 21:39:45 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Hamid Amirrad <amirradh@gmail.com>
Subject: Re: Changing ethernet port speed
Thread-Topic: Changing ethernet port speed
Thread-Index: AQHZCbtB+oCukyvZuUe+WU/GxdI1mw==
Date: Tue, 6 Dec 2022 21:39:44 +0000
Message-ID: <20221206213941.GH18848@packtop>
References:  <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
 <20221204234449.GG18848@packtop>
 <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
In-Reply-To:  <CACFAz8CO7sm6TXCct35kOH-mWZOAj=UHuRisgw3rSpawRxr9jQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|BYAPR04MB6037:EE_
x-ms-office365-filtering-correlation-id: 9a11d0d8-9691-4ba5-4ed7-08dad7d26438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Fwq6q70x5mzuZmkxqy3/LIupXVgBc+seT51+Zg7k3pP1bEUCD/nBIG1bbKHl5WgQ8w5m9fQCPDaQtXe4sUMNDyulWg72WWTNemBCcCsaFcDPfhwvzwDxpHneAMKmjizF5uJtqdS3OCl3gxdPkJ0s8nfAYH1jSZVH9w9JOvTytcJOAyEP+2F26oPy429wp27dWEWDndgFdCZfdLhjqi5Npy/rewoGKSFOBqd8ve1pw53z5xV08DuB9ZCdySrt0aDZFCHTftNwoBv6e0OxEl5Dj54d2c92nUeP+FdqjOX092Bh/JH2CfNgLqUd4xLphl5RNLVICf+ybiLthzF/uqss6jkROqTTx4fN05O86kXgQqNV3WrDVDniKVFSwh+8EfIwtCcCOjaUlL4hO8l6IJlo0SMAgcWVujWioqaEWKxaETWMgS3NGHrrGMyWS6DI3l78J3XVeE2ekAgEfwoXpymHX2TfSEJJISmxLN67yfY2eqOPHwJkAtz1hQVTj5dbnO6XJdkXh4iPB4QUID3Lz1AoNY6S/SQmL8KwxdGaPP69lz+Ed3uRo+PMVHsJ+tY+AyxmMdatYc0XJ1v3plHGaqXVsmunLJI53ETIW1KaNLn/s9Hmk2Bo1LZRWMCQMac9AONro8gcYO4B1OGai6TdsNMLQ94wCsPRLFx4dvztQtGMtz4INSMoz0y9FTR+E84497oXb0NbdzumLn5yBalIKrrL6hAIcuWsiqr6N/6K43UmzAQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(38070700005)(122000001)(38100700002)(966005)(478600001)(3480700007)(6486002)(71200400001)(2906002)(6506007)(33716001)(86362001)(83380400001)(5660300002)(186003)(9686003)(26005)(6916009)(6512007)(8936002)(41300700001)(8676002)(316002)(4326008)(64756008)(66446008)(66476007)(66556008)(1076003)(91956017)(76116006)(33656002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?iwrVjXWtR9AGE4Y4WMFE/slytr2JP5Rm95x20wNSCbRVckNF7Vavn+xmjqvS?=
 =?us-ascii?Q?n4Sf/yvZA9+GL6QYVLLhpG2ZNRfH+vRd+t92i2YPgqSjX+LLxdXBnQJDXjJo?=
 =?us-ascii?Q?XKiGCRWjw6tS69phjxaCPrfdYPAZtZSvetAZvoh5+cVybC0ZSL8Z0DGSfvBV?=
 =?us-ascii?Q?YMZ9PpBUxZPIT+wnXeKeGM2W+ubABtzIn4Bq/QhQr680SRaSsl2UlTnFannJ?=
 =?us-ascii?Q?pzX7JML/Kx+O4VTOyBRbb/ZgXkcEs2nT6ak4+h7JRU0qde3y4sEeEUCwXx4u?=
 =?us-ascii?Q?jkxig05BzkQRdduSB5bxlPcSiCALsLoEdGlW08cH2xdykm2x6N13HV4mb+/D?=
 =?us-ascii?Q?PkllFTkSyBqmMLcqnlPmhV6maKC4MDW9SdYaNUliwjR7pBffzEzHHi2VBvsZ?=
 =?us-ascii?Q?nl6/n1w/9UYuK3IYJ3MlMOxu/PpvtHiB8o0vEyNIjHbOXzmfPSCAwpotEKrj?=
 =?us-ascii?Q?yZC/I48k30sFmFOr7nA539LahA3s/s4CSe9+sD/rzBn178VEmIBdEuQe89jo?=
 =?us-ascii?Q?vvR0SATKJ3c4XWBI7qNi+cvVwov0vtoD/arXZjLg95yQ/h+Moh4WBc29fqDR?=
 =?us-ascii?Q?oR/r5tKTkSnGE9baIsQy4zHtzdr7vvF33bw4FUZHSX57V8Pnm7sXajoVnFCT?=
 =?us-ascii?Q?SqQR/vQf7GiO+VJj5yk0x3nnkTMRjq3I5rg4V/ElgNvM/Y8BajcYBOPXmkvm?=
 =?us-ascii?Q?q82+zWsb6JFg0MyldACyRwe7KZZ7mV0Tl0OLW+Q3hm4yhpOQZJHN3JS3WXIO?=
 =?us-ascii?Q?SxFAgy0ff1blus1Ts3HKI6Q0FbxIr0a4eqm5hf79pLq38vNC5YauPR7hEOml?=
 =?us-ascii?Q?dsshEOGq4arOG/r35HvH2ju7dwKczS+MQ2dsuciEt23+ZqivpMLHFjbxbNNj?=
 =?us-ascii?Q?BXlVZJg32FQCwJhFwlbyZ0uvpG53lzLweLXPJi8+kezmzq3sbKqWZk7dMhJP?=
 =?us-ascii?Q?LOFkQKxr+POibTzpBTDaDQIC8KwEuvS8Nw5ZRwX3r9YQU34RFMLeAArqGdjR?=
 =?us-ascii?Q?Ndga08Bn+1oU93x2wdMyQcvJO9uEh78rEw9EP5QIxgjb37lOZkdco1mnMxi5?=
 =?us-ascii?Q?Y4qpLS7ePLluGkKXaR2kB8XVWzaa5/fwPgQJlrxcEvFLPQQwUPPaBSX8CF4u?=
 =?us-ascii?Q?5LUjGQaGeNp7U+Rc1AUkjpoSDCw0NOyFRH73OvGVdWYzJE6cfAaYK4fFbEG8?=
 =?us-ascii?Q?6ZTKb+bn9hlx0oj270FP0VEHQLTmRI2aqU3qIFrSIuhc01RHBRvwkelNff1s?=
 =?us-ascii?Q?zT7ljKLpUrg5KLOp+LIxlADtZVy0RYEg9Gyw8eJTfNzJylOWPMmo3TP7zDQ3?=
 =?us-ascii?Q?DYf6hbc8ZIomrZXpp2LohnI5KFe5Y5JPhQJuhQc/M5G3cxS9XV4Gpi7XeYZJ?=
 =?us-ascii?Q?25a4y09U7M9Uokdnx7ZiFasqMcpnlQTuDGIxLte72WH0xmgDNU1TBTY/utK8?=
 =?us-ascii?Q?RjZ+Jym7NMO2JF3wr3qYdIcIAtANizN13/NERHt5/Tz6WiCvl3lsHZXqOu7E?=
 =?us-ascii?Q?fPcYL39pl7UYJA97nJXZTz2mHfUp126MK31GVIICZUvb8XV6QUWVbiiJ6uMd?=
 =?us-ascii?Q?A50CdsZFTJ28Crtbj3i2TzOcI2T9JfLHDPfJYuza?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E5ACE927FD94CF4E9AF4B41A93A99A4E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	NpXXXimHkEKsQsURba2HdXb52Q0KlBmvnh+r7qCupau0mVLQg4eV8M6mG2KjV3bWUBuz24JYAagfONx8KNqnUq3010u2FZj3Vm6tjgZY+CUTy4Udb90EonbbXrkRYaQw/rw6RAtBn99wXK0A158V7Ea6mYGtOXrdusVNLEvbpa4yt4gPygd5BoFgtP7kwGte7KrVcp6Oy9zZ4IIKPTvMq96enAyinRQPZO7QoxTBkKc7ed0ryFahyJ6hcxAppZHIJq45EOWJDpaMJ8dXNkQ/aMmjFv2CwOiZsJhfSoAbeiOqKi5toXIY859+We80BFWvSG8vC40XTlgCnLE0qxghVNVXiuwXzVUmLwo6NNSmekPVDqV71ZbTlxkMX6sY4ntjwuzriQqQ9vSSPUQvnACC1X7i4UKsEkXFhi+BGKGOX9GvIT/POxwJusJ5pE/8FY+X8NB136JraoEBdinamidgVNrQmE9v5GnOe1pcwGE5FFqbGj8rV8S9IuYVYNv7G0j9t4EUiUSUT/10dmvnBrmraWov84pG7iv+OiO3D/t+Y9+whyk8bKX1/2DClM+kSYBftXnUUk711v9NVqymhA/ORp01h8XDshHG2jKvSULPor1IHBLoBRIFcP8BSi3QXdMpyi3S7EtYELrYFmmSIvOHIGOAgrJDPpT3Pp+0HkB2+j3U7JMwCQvdZ3I9V79mpncqLHXzob6rDuZ2up/IxoqAiIOTemItaOJww7GiuvOP1yi8e+dygdhRoGpV9o8OyAJB+yPjHdZzfHex4HJu8/n5B7mUi/TJhOsNz/a3fYbN9JRFiL19qyJQkDJ4Gt+qYJIT69xeV0jqX5t0r5spveG++F/HkjgeZZhc2BWbBT+9Vhg=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a11d0d8-9691-4ba5-4ed7-08dad7d26438
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 21:39:45.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yL3cwx+pyhmWK1QksgLz4O33lu9gYYkMguA+25p/cqEwiY8o0y9GWRYsNnS/OTueLr+uVK82eMQnKC37a+Jv7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6037
X-Proofpoint-ORIG-GUID: OzQltiTeubQOFFTnVBqwq7r0TgYA6Y0u
X-Proofpoint-GUID: OzQltiTeubQOFFTnVBqwq7r0TgYA6Y0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=937 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060182
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

On Tue, Dec 06, 2022 at 11:27:47AM PST, Hamid Amirrad wrote:
>Hi,
>
>I see that the u-boot has been recently upgraded to 2019.04.
>I created the image as follows:
>1. Checked out the code
>2. . setup evb-ast2500
>3. time bitbake obmc-phosphor-image
>
>Then I copied the created image (bmc-image)
>from /trunk/build/evb-ast2500/tmp/deploy/images/evb-ast2500/obmc-phosphor-=
image-evb-ast2500-20221122160306.static.mtd.all.tar
>to my LC having BMC module. I used ./socflash.sh to upgrade the BMC image
>to one just created. After upgrade is done, I still see the old u-boot
>version (below). Is this something else I need to do for the u-boot to be
>at revision 2019?
>
>ast# version
>
>U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
>arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
>GNU ld (GNU Binutils) 2.37.20210721
>
>I am using BMC simulator on another server and on that the u-boot revision
>is fine (below). Not sure why u-boot is not at 2019 when I compile the cod=
e
>directly.
>ast# version
>U-Boot 2019.04 (Nov 10 2022 - 00:12:58 +0000)
>
>arm-openbmc-linux-gnueabi-gcc (GCC) 12.2.0
>GNU ld (GNU Binutils) 2.39.0.20220819
>
>Any help would be greatly appreciated.
>
>Thanks,
>Hamid
>

What OpenBMC commit are you building from?  It looks like evb-ast2500
got updated to the newer u-boot branch in February:
https://github.com/openbmc/openbmc/commit/7d75b9b68370374db00e9c99b5406ebb6=
b18512f

If the same image is showing the expected u-boot version in a simulator
(qemu?), then it sounds like maybe your installation procedure isn't
doing what you intended it to.  I don't know what the 'socflash.sh' you
referred to above is; if you can boot into a reasonably healthy OpenBMC
environment, I'd suggest using the normal firmware-update mechanism.  If
the existing firmware is something else or isn't working enough to boot
normally you might need to resort to a hardware flash programmer or
something (or if you can get your u-boot networking working at all, even
at a slow speed, you could TFTP in an OpenBMC kernel/initrd, boot into
that, and use flashcp to write the full OpenBMC image).


Zev
