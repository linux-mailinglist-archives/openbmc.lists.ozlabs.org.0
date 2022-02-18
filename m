Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F64BB062
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 04:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Hjw3TQcz3cRs
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 14:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Wiq9nht1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=5048d68245=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=Wiq9nht1; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0HjP6yLDz3bWj
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 14:48:24 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21I26RWb023833;
 Fri, 18 Feb 2022 03:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=S13XfSgo8y2CCKKDLjV/uZSrJmz79lmEQpC4lrG0VIc=;
 b=Wiq9nht1IV1osxn9DAYAXoXdyAZqpTewIZXE921Ba8mrZoYbSyIf8+g/px0oKJryYfA0
 i8VuH6i/5hgsyoXBaOiAHvBfyOo5PshY3VfqSBa6gM0YwWEBjRO/bQmeAU4y+MgNRaxa
 PnH9JOYdIytVfEuTXgNCsorb+MoGBnTXusHT6zwDPIiy6TpGcOEjcb3MQDDMZeF5LkhJ
 /WjYCWqn/jrCzApiRI8bnbJN33ayUMgocF9lZ556urRVW8B3ljwloVgqDbKwuV1nGP/4
 TkFAGdnXTtmGu6UhSVhqBsLHAc8/pYaMmCAHpM6Wup0uZ1HnTzmNY7CSe5Bhx419lAKk AA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3e9v0gha74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 03:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixy3XENtYYeOka1+pyod7pad4hN5B9ZaGNBpNCe8MghuwIyzsVM+yL9Eg63VJPRvtPmAfnF439oJMQjBpOyN+ytRCsNYmqgEgP4ecgZzj9EAE/KUDpH6gmGdSegGy+oTBibQfqECvt6w8dYQa9a4uw03+w3yrdkQrOVI1h2tRsbrnfcNPmAPe0VMxpFXXtboVJNXKHSe0hRPF6EgNZlUQjrnDQTnHa5CVWo936THCIpd+W3e1qzjIEBjvigolk2mv/lxsbqvPx86lZFqzNQWUron15ABzlB+iCqGp+EXrSmxg7NeXY/w4C+5IAje7MGiVmeKU6igQd81sTRaWjAWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S13XfSgo8y2CCKKDLjV/uZSrJmz79lmEQpC4lrG0VIc=;
 b=fyAAFVpoYkqyf2LEl8fkniHBBtlV43HeTCBlG+fGxOMtQcMuR20jIITsrTlGKqUL+05D2ZM3M9v98xDef+nYagvtJmXsKLyglD0UW4KMNmo8UsuW09F1j4DKHZa05p8Ix5ityEMeJs349DtQ+38P1mXi+sdJ9YI8YE4Ep7yahQvsKQzBY9PlrcSxCLJxCQI/yMCiB6sgJbZYpB18y2BMZDuuRXOPkQsohJEoGeBG4X8zCkzAGNM/ih/4+FlTMZyuG2KTE1s7lFHd4ecDLe4jortixwZt+621ijfx9Fn9+B2pjQsR7Gsc3hAV7O4Bl9yot13E5LMq48AdmsKhW3YC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BY5PR04MB7027.namprd04.prod.outlook.com (2603:10b6:a03:225::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 03:48:14 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%7]) with mapi id 15.20.4975.019; Fri, 18 Feb 2022
 03:48:14 +0000
From: Zev Weiss <zweiss@equinix.com>
To: damon3000 <damon3000@163.com>
Subject: Re: Re: FRU access configuration
Thread-Topic: Re: FRU access configuration
Thread-Index: AQHYJHpbAKEarqeomkuzy0PA41yt9Q==
Date: Fri, 18 Feb 2022 03:48:14 +0000
Message-ID: <20220218034814.GS5754@packtop>
References: <ad1d881.3105.17efb5ed0dc.Coremail.damon3000@163.com>
 <YgwATu32A9FJUHxk@heinlein>
 <3cbbabf.9be4.17f07606bbc.Coremail.damon3000@163.com>
In-Reply-To: <3cbbabf.9be4.17f07606bbc.Coremail.damon3000@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17135f5a-e1af-46e0-2593-08d9f2917df5
x-ms-traffictypediagnostic: BY5PR04MB7027:EE_
x-microsoft-antispam-prvs: <BY5PR04MB70270E07F66B57FAC15A0CBAC3379@BY5PR04MB7027.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LQHxqrYKysWa+S/Kss9yzFaqwQgqyv12Wdi40zAA0d3FfN+Gw+ermzAaAJvRLsizP4RDGcyaeQymx/PLusViie5iDK1zXPK87YTLITXoTkBnjSxwxuy7I9d3kwNZ8wXzFL84/MJYvbPQCIKPW4pkYDgi6lu95Fj2RR7LwweQsyQirT8nJKWc+w7y7+WL1UbDI/ME+fV2Z/xi0yWMi29zKz8BwzsNDMyjmjxQyks3iPwBGoKocXAN3vvr94HfUoYo3F2S3ktUE4jtGMSYTMMp6l32SbsBZBuqlzZjy6ANpWuMnI9bKCcz4usR1rbRrEmVzzy3nj52sp31FNzQk2Da4CU7Z5+njS7mzL+jnVCYuNBYYLfE/Tep4oJpjsqwwzES4Skx2XRP8MH2wLpYvLcaSKYQsW4IGbZkYh59YDtDle75QIoLSkTi42HrtkNZWlE/IuBKJ65sc6YcAB1NDXLuXPnfqpc2mVzmcAdqq1unSsDLZgnTmFdaIByyVrpSQ6d3I3qMqbGDw90xFLYIv7zfefMcmWlnaqKkD8VcvIMg15ZcXbEmlFjI1rBQG4XMf2eNlX+nsPgouZZ4mVLKQqal3AIhW6OkYxhq30wyR0b9TGxMKH1gjBbR50KuyBEiuvgI/eijaN3VQ5pMDym6XvGeIwWccexOwsR1OJAvbrs1LYowg9xeHxJcu87CuFPf/Ec6kYsUPN0P2MWASbgltaEVjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(71200400001)(6506007)(38070700005)(2906002)(1076003)(26005)(86362001)(186003)(6512007)(9686003)(38100700002)(33716001)(122000001)(83380400001)(33656002)(4326008)(66556008)(8676002)(64756008)(66446008)(66476007)(6486002)(91956017)(8936002)(66946007)(76116006)(5660300002)(508600001)(6916009)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BfAB1lQIUIi+RaWLpDw+Ps3VJwzI53Q14T18o8v4a2Lk0yWsybWVbjNPymav?=
 =?us-ascii?Q?kreOSUFt3dmz305bmZkWmXxSz02py7O95tlxfcCsVo6eeiRMkio6XUh9sQ2S?=
 =?us-ascii?Q?HQXKtHYPxpz9QZsgndhrSRHsP+T5hHCFYMp9OQhczcW7G4WVD4zIWqVNuc9f?=
 =?us-ascii?Q?260PS1UkjIjd35MpM06kzQN/wMIMod6Rzi8ASxe5WRQjqS0ho6gvsVZOLOE5?=
 =?us-ascii?Q?z+nKaK52dgp3B61tjRl3fEP5XKpwyfgD2EOLluev2wXA1m0zcEYfYYkSK8Nt?=
 =?us-ascii?Q?v5srjDyrNLgmBRsHbngxjkoK0sUQ4FOSBUbfOBduFJoFH2u9zk/HommZgI5B?=
 =?us-ascii?Q?H+HwfNvGIg5npyTGVFIbK8OVYjffGxxVUDN9nxhsGdIlUheWCfXKPp9swyGX?=
 =?us-ascii?Q?RIAa4WlSHo3jRuKzunEBN5cf215SFF6ptI3dbQyhcYzxJsv/dyPyZaRRwqSp?=
 =?us-ascii?Q?83x31qCHWCXbYuL+4VdfjiY9WusY6f9Q7HeLb6ZOJzs91MPOPjiLOlfYc/6J?=
 =?us-ascii?Q?pp7Pte5FFS3BGpgrbV4PVvwLzw2uy8Qmu10h/AGbzC4L/BS+VlxPORg8+6SZ?=
 =?us-ascii?Q?xXLHchzJX4cmf8K+ATP8qNysCJQd1wBk73LuMNJQrBWNile7WU/gzNj5DRPs?=
 =?us-ascii?Q?aRwjRY313mST2V/dkBpiOToKFU3MitgQScssex23ne+oNOWPfn/NrsEHJOFP?=
 =?us-ascii?Q?o2KkXe7RUIeDrH/YWlrd17OoB61cawGGxIsQ5pxGnpZmkv+q/3dJAXZPEqoL?=
 =?us-ascii?Q?lT8ghZTPdTV3F5uNM3H3CsxwAW1lIFVhMMgmJR7Q8nD3YAQ3LthzJkIl0R0y?=
 =?us-ascii?Q?xS3GVyesEgDR0g/ERInzmNitUU2/aKN1qdAGlpSAdExS+jvel4nes5hrDaxR?=
 =?us-ascii?Q?ozgIZtWj6aeC9azKHFtGMB9JSnwssRjJNZfHHFB5DkR46NyRBa5aWHBP+iKw?=
 =?us-ascii?Q?zoUCVIpQeHnLx1B9Kvak3lLDpqpAP1wvX51eP03ZZof6H7/mMB3KMwdJTtfS?=
 =?us-ascii?Q?BBlQJvsOZt5c7UfZBQhMywrpJZ7KHBIzozXz8MsmLjrBX5AQW/MEs25Dt08a?=
 =?us-ascii?Q?OK0+6cYjT1wywRbf7144GATgZgrFESW72UaoXp0bRS7cZAyexNFC9rebdKkS?=
 =?us-ascii?Q?/cZ8PWMm5xKGsQ9rVi3N+6WKQxelfXj540IsloOerplH6JM7y7h2KRNb6YoL?=
 =?us-ascii?Q?muFeVR02PVBULw+LX/t8BIuNsMj8/jEBpLjcj7DLNb7nfQEpkUUVZIWJOKFU?=
 =?us-ascii?Q?kmg0IT5px+HCvzjuzGqwoBCgX5Ntl8+OqQnrfw7g1WeQIfmRnlL40O/eOQtx?=
 =?us-ascii?Q?Lbyk4iQ/wSRKFs23vywkurnM/FiXmT1gOVUCdqOQhK3JZonv42dij7Rj/Iky?=
 =?us-ascii?Q?ObSPCW84MQgwhPKFlsuRbyGOeQFZx8DZbbJzau9gmAkll9RGPcVr18VpoGUv?=
 =?us-ascii?Q?VszIQzShG9Ps4E+hOGhSfc7rDWb6tuMCzTr9dT86QJ0qWBpfd1iHjnXhOrat?=
 =?us-ascii?Q?ja0yK7LSsf3MEAtoH/6yc+wKdeXsOPqpnrnkYSPxlK7PwlSlfItwvKs7nB2e?=
 =?us-ascii?Q?slxejdUfvksj9LYdLQNKwOVLqSQXXUsdj/3SLZVCtJq+9u3E1VfMCuMFXYGy?=
 =?us-ascii?Q?PtzUuctOsA+oHRlfRlk0a8o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AADE89CAF4089C4DB04F8EE9FFA3D5FF@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17135f5a-e1af-46e0-2593-08d9f2917df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 03:48:14.6565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1k938i/JTyxC2fjQNdL5Ohx8CJiUOiOGALJAmQ6df0QJYrHnVicb4N6l2rfGIgoH302ImCT67WS9Hx6Q9pbSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7027
X-Proofpoint-ORIG-GUID: LeNvI_vzP6fjclD0ul57s57lQEWCqHY1
X-Proofpoint-GUID: LeNvI_vzP6fjclD0ul57s57lQEWCqHY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_01,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180019
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

On Thu, Feb 17, 2022 at 03:10:33AM PST, damon3000 wrote:
>Hi Patrick,
>
>
>  1.  According to your suggestion, I can scan my FRU information via busc=
tl command, but entity-manager did not start and can not be accessed.
>The log is as below:
>
>"
>busctl tree --no-pager xyz.openbmc_project.FruDevice
>`-/xyz
>  `-/xyz/openbmc_project
>    `-/xyz/openbmc_project/FruDevice
>      |-/xyz/openbmc_project/FruDevice/10_64
>      |-/xyz/openbmc_project/FruDevice/10_65
>      |-/xyz/openbmc_project/FruDevice/10_67
>      |-/xyz/openbmc_project/FruDevice/3_80
>      |-/xyz/openbmc_project/FruDevice/6_72
>      |-/xyz/openbmc_project/FruDevice/6_74
>      |-/xyz/openbmc_project/FruDevice/6_76
>      |-/xyz/openbmc_project/FruDevice/7_81
>      |-/xyz/openbmc_project/FruDevice/7_89
>      `-/xyz/openbmc_project/FruDevice/test
>
>
>busctl introspect --no-pager xyz.openbmc_project.FruDevice \
>>  /xyz/openbmc_project/FruDevice/Brahma______________
>NAME                                TYPE      SIGNATURE RESULT/VALUE      =
                 FLAGS
>org.freedesktop.DBus.Introspectable interface -         -                 =
                 -
>.Introspect                         method    -         s                 =
                 -
>org.freedesktop.DBus.Peer           interface -         -                 =
                 -
>.GetMachineId                       method    -         s                 =
                 -
>.Ping                               method    -         -                 =
                 -
>org.freedesktop.DBus.Properties     interface -         -                 =
                 -
>.Get                                method    ss        v                 =
                 -
>.GetAll                             method    s         a{sv}             =
                 -
>.Set                                method    ssv       -                 =
                 -
>.PropertiesChanged                  signal    sa{sv}as  -                 =
                 -
>xyz.openbmc_project.FruDevice       interface -         -                 =
                 -
>.ADDRESS                            property  u         80                =
                 emits-change
>.BOARD_FRU_VERSION_ID               property  s         "UVD050"          =
                 emits-change
>.BOARD_INFO_AM1                     property  s         "V1  "            =
                 emits-change
>.BOARD_INFO_AM2                     property  s         "0123456789ABCDE00=
1TAG0000002  " emits-change
>.BOARD_INFO_AM3                     property  s         "R1B "            =
                 emits-change
>.BOARD_INFO_AM4                     property  s         "XX1 "            =
                 emits-change
>.BOARD_INFO_AM5                     property  s         "0E11223344E0"    =
                 emits-change
>.BOARD_INFO_AM6                     property  s         "02"              =
                 emits-change
>.BOARD_LANGUAGE_CODE                property  s         "0"               =
                 emits-change
>.BOARD_MANUFACTURER                 property  s         "Huaqin Telecom  "=
                 emits-change
>.BOARD_MANUFACTURE_DATE             property  s         "1996-07-07 - 10:5=
7:00"            emits-change
>.BOARD_PART_NUMBER                  property  s         "NA               =
   "             emits-change
>.BOARD_PRODUCT_NAME                 property  s         "test             =
 "             emits-change
>.BOARD_SERIAL_NUMBER                property  s         "3120E33900011X001=
0            " emits-change
>
>
>
>root@sky:/etc/default/obmc/eeproms/system/chassis# echo "24c64 0x50 > /sys=
/bus/i2c/devices/i2c-3/new_device"
>24c64 0x50 > /sys/bus/i2c/devices/i2c-3/new_device

I haven't closely followed what else you're doing here, but this
definitely looks wrong -- I think you meant to do

  $ echo "24c64 0x50" > /sys/bus/i2c/devices/i2c-3/new_device

Note the position of the close quote -- as you had it above it's just
writing a long string to stdout instead of sending the device name and
i2c address to the sysfs 'new_device' file.


Zev
