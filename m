Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B26EA6D5
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 11:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2pwp2CkPz3fSr
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 19:23:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ld/flIeq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::619; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=aishwaryj@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ld/flIeq;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2pw81LTkz3cG1
	for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2023 19:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhT9aLQF5fRgxJenujn/yoEoj056RT8WL5FJu/ADRx02sMuCEMgnRh7r/j5Y8BZ1wq+aM9A7uvvmWv7sKpcqqjAXKDDfXBSZ/x7ivzY8My4fxejnLCLMCbcVXYw+7g2GDnPnjVkYfcswmJszaIHN+SrUaW8y5Zf9q/+rRNVG3NnRtGM65zXUeRVi2HNa0Y7Ct3Wdwbz8ewgY2L7/IClhMF1OP0JVOuiHhoHxZV79JmKgT+ikJlmSFkYFhJKnGgKkGtnqEkqvQXYgwFPspUydopOX21n6q5q6IZ7lN3gej/9XFfN26/8E9pft7DR6mTymi/bFWhSlF6uIKRdFaI12Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqw7Pwv12xHzLfRt3LIPcpKOn+rCDOKQGfjOfKTgRBc=;
 b=VUbDvEa/AYXMTZtRZbZh9Z0KUOKo8lRNfJ44pc8Ho2/aJSExX6W+b6tbGbUuBkj3FZYJwBT7sH/CNMedN45F/1i+PbDfcX40Vo62Hzo5EzKzNuYLeBmeIp7cKRFw1wAEXCWBBVJajC30Aw0FAuPaFpjwYV90SOi+dHwiMECikHTrtGvWDH7r8GV3XcJrIl8OGBTEErLnchp3EGjcyd4qeR2/5dFghK5E8KTG/l03DbidQ3/qYZHbTHqOYtHBKi3+Kl2KQhvZyo/Js1zQOrY1GSz27AHJGWYAwaT8ED051Q4TSrEMeSf88Em1rcWLF/8QYGRSVbDLb3kX22fgu8/acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqw7Pwv12xHzLfRt3LIPcpKOn+rCDOKQGfjOfKTgRBc=;
 b=ld/flIeq0tjUDmqHmX6T7UEVSMXVxl07SCF5JRKOPjrBBo02bUUHKYuvfNe7KI/d3s4B1ypnxaFW9xatnq9xSOMLrkq/uedsKpcmwq3DzKDrc2x7ffOOYoAqVjfgfO4NNbHw7U3CDBhfyLRP8fF5wB/ieFQwxdNQjSf6Unwa0R0BDbDUTX/xcUIYiIkpvayPpERZITqI6RwcjJhlbfxFaiUUuSjenLaxk01IBMFq5MUxfQ05xv8AliQeBWDCBtFLZz3HapiVx4w6tnWEu6c52wrkkCNESHUNefRD5SVLSIsjlMIAcMvYAc9F1gBQxlzeOv4HwT6iyd9yoRjz3KCsvQ==
Received: from CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 09:22:22 +0000
Received: from CY5PR12MB6083.namprd12.prod.outlook.com
 ([fe80::a20f:1068:dc78:27e]) by CY5PR12MB6083.namprd12.prod.outlook.com
 ([fe80::a20f:1068:dc78:27e%3]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 09:22:22 +0000
From: Aishwary Joshi <aishwaryj@nvidia.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: $expand on sensors slower than individual gets
Thread-Topic: $expand on sensors slower than individual gets
Thread-Index: Adl0MoiiwhhZKvu+RDWZGzu/ISDEuQ==
Date: Fri, 21 Apr 2023 09:22:22 +0000
Message-ID:  <CY5PR12MB6083E003B72438968F80D7D0CC609@CY5PR12MB6083.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6083:EE_|MN0PR12MB6319:EE_
x-ms-office365-filtering-correlation-id: 1761c90d-4c57-459c-50d9-08db4249e999
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ApPVDirbRSxLKnssHzNmjJrSyz130Esg2sH1YDbph8udMlN5HUlUOWAg+TBL5KyiuZYbyNU25R2hlSVRBOg9LoPVONXOgg/OwcCkn4bFUVCV7qouT0S1eSjFV0UMeINBpkAMKbSJOEueEkQjpbBq2TmKEI/u6HQdkVSDx7er+xehPWFUcrtC4DkMerjQs8uOtg9PU85P5gc2GFu7RWm4J5ZKh3AmA6BZdfypCtZiGrSuAdJHPuhGHKeixZIGagcBUpXNbfVdSg3Vs0PJjci2rIWlQSqFz0tNmO5JdxTlxNIOxG9djPY+0vj7ljmhvUQU9ww1BkKmQNPyx5vnTfXH00mYjCL31G5hCjiNFm/PJL1K7QmBzKLZ1mAxMLJar3++UjFjKTdk+4UKbBbNslVB4R4umAVbjx30Ck0ZMf2yh086M1mlo+SDFBRSMwACGCdkWTWcxW0mPvmZkxafUYU09MV+P8mYThjpAZduPodxCcufD/TJofO+UyBBsDZpMG6WdMzzPbPkEo3UP/y41EDBVdJItcpaig+ZVrFMchDwtfXCaWm4l9q87PCyiSUhIIuupuLpODgvIJtxzlH8xXszsbqXCuB6uBjuq6mhTjozA/9gXI+XxzjIQVJzUfBgtTqWCgUkucY7+POraSN3b4bR/Thao0pcc54lBKvVfOL9+KY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6083.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(2906002)(122000001)(38100700002)(166002)(38070700005)(86362001)(55016003)(478600001)(316002)(76116006)(64756008)(41300700001)(66476007)(66946007)(66556008)(66446008)(6916009)(26005)(6506007)(9686003)(966005)(7696005)(186003)(71200400001)(52536014)(9326002)(8936002)(8676002)(83380400001)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?INhZuM8HNsW31NyYEEsuAOf0/9X6C/akG+zWv5LEawv/otbLYrWsFF3U9zBz?=
 =?us-ascii?Q?a9Vpd6Wd8uMl/TaXWjn9/k/cHTLW8cEg5BGV7fp2YiSlW3XHxSPD+FGZkvhJ?=
 =?us-ascii?Q?AQQnNP6Ynkrrdl8tIViTe5A9ry7l+qkNYWG+Wx6FgkXci9Bt7Rd8uGQxX1oe?=
 =?us-ascii?Q?JWSY8kntncuOzcQBF/iQRU5L8NngxOb4kEGc0PdswmwIrw2vRq+neUiIeasr?=
 =?us-ascii?Q?xckhLxw/t9yijPYPch9QMt6qYsAgD2phL/FdR+c/72cH9h5ncxOOxHOdh817?=
 =?us-ascii?Q?I7Eru/372srnBsFYUFDMexPRGhABMHpYuUsQ3AzBu5gjgDT3JRklbo/11hcm?=
 =?us-ascii?Q?fsHm+T+q1uZ/ptgBnSYHmiqG1WPo5HYIbJjNeVxsOtTaMsjTya/GIo5viQbR?=
 =?us-ascii?Q?BR5BAqWv6x/MpFLrnE23HObrBC3uL/NIsDE9alOAG4J2VkkURiatgt/1r/0/?=
 =?us-ascii?Q?JDA2fFeAEyelJM3orLKrOy7wYeC6I3LoulWNYuoajaWUD6BXHh5TgsqIdNZo?=
 =?us-ascii?Q?HeaVnetS6jm+rxt8rgYIMGQyfN+PaRJK1uuMKlIQ4vqjxebh4mmoSlLum9Pu?=
 =?us-ascii?Q?5TUpATSKzuuce6RptL4i2AlOMvzQCpDafO1Eq8eWSL5h18cfVfQQGYFw7pED?=
 =?us-ascii?Q?DnWEeIKxKpIdynAazhRps9ZVNzvfedT7ruLz0fPDKjUKxJ7Ymgv1gykocbsx?=
 =?us-ascii?Q?68tNwMO/YKXurKnPIuPy0rm4zG6z0LHceBAmIwQif7WNHY2g9pK6eAISmNkT?=
 =?us-ascii?Q?2+rStaowBsOv0m96Ir03adhQrhyZpPrGPFAi6LuyM1hj3wSZVTO1EHwTmL3B?=
 =?us-ascii?Q?vDptt1utz3dc1qRW4M21R/EsQ60MVSg6z2PCrmKuXtdYgvPtGL3/+Oegye3Y?=
 =?us-ascii?Q?uNqWYMomkgmH/GO7qaS1cY66SkbP/ZfcDR5Y/ByXZPOG7XlE8jreq6ufKAN1?=
 =?us-ascii?Q?ZsYN2gtqlOnWwtdnmi0NJn7t9f3Fb9XlxDVLFvOY/A79meX9dP0tKiiAXypK?=
 =?us-ascii?Q?GTGbgdVaJj2frAKwXWPfCrwwYPDKAioklGW3b6HRKKr0F6gJGkDZ5+wJy1rd?=
 =?us-ascii?Q?8w4NTiTipS37BCHAzjmupUCwEwqdjAnNi54/3jJr2tEqZUqnv+aGpSimncT8?=
 =?us-ascii?Q?GeBsYI2kk6h3xHG3vullsIw/+farMWdOxXM8Sr+TJFIDY9sFQe/Cp7jXP6fT?=
 =?us-ascii?Q?DY3d9XDZ7fUo4kCKVTjahJ48z9mHI85zCxxkJEQQ+CCksnFoOu5O881vn6VP?=
 =?us-ascii?Q?8hg9btatMcal3nabpYuHw2oMlJMfqaXwlnzclpAa/ChRphce08YSWBCyVj6H?=
 =?us-ascii?Q?76/Wam1bAuG5xWDCSBLxIVB3V+hEp6Rewqu40jTliRXugYnfG3+RstApahJU?=
 =?us-ascii?Q?ZB1G5+ZoeYGTwoIcmsHFUtYPvWn8QDmR7HaMuJ/OipR8RGbcPOYAu95ha50K?=
 =?us-ascii?Q?aer3F8RYsVnPP3C9XCtlvgb3rJZJAARcYw5RMPs+bVJjRJrhghQPXsbzqoFr?=
 =?us-ascii?Q?EA8H7EBrlsMPBIHwXpp6RFwfuFMhr1qey/0TVQLTzuag36jZ0oSYGa8c5NgN?=
 =?us-ascii?Q?QSAfVw7JmKBn38SZmiGX6oBLtxeNqXyQCxlDERVG?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR12MB6083E003B72438968F80D7D0CC609CY5PR12MB6083namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6083.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1761c90d-4c57-459c-50d9-08db4249e999
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 09:22:22.2060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6oULr6Y4VLRiWm7XG7Wr+SWWAObtXwjAekh9Ajr8V95//p+3T7KyoAVwj/zwMWiDJClBFSIRo2czhP8uRutROw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
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

--_000_CY5PR12MB6083E003B72438968F80D7D0CC609CY5PR12MB6083namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We would like to get feedback on following performance issue that we have o=
bserved with $expand on /redfish/v1/Chassis/<ChassisId>/Sensors URI compare=
d to using GET on individual Sensor URI (/redfish/v1/Chassis/<ChassisId>/Se=
nsors/<SensorName>) on some Chassis

Little bit background about the system:
1. No of Sensors present on the Chassis_X(where we see performance drop wit=
h $expand) : 7 sensors
2. No of Sensors present on the Chassis_Y(where we DONOT see the performanc=
e drop $expand): 31 sensors
3. We have a common service that host 24 Chassis (including Chassis_X, Chas=
sis_Y)
4. Total No of Sensors supported by service that host 24 Chassis instances:=
 102
5. Time it took with $expand on Chassis_X sensors: 0.48secs('/redfish/v1/Ch=
assis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')
6. Total time taken by querying 7 sensors(present on Chassis_X) URI: 0.6sec=
s
6. Time it took with $expand on Chassis_Y sensors: 0.48secs('/redfish/v1/Ch=
assis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')
7. Total time taken by querying 31 sensors(present on Chassis_y) URI: 0.91s=
ecs

We see advantage of using $expand on Chassis_Y but not on Chassis_X.
And Based on our analysis on $expand, looks like performance of $expand on =
sensors is tied to the number of sensors hosted by backend service and not =
by the number of sensors present on a Chassis. This is because of "GetManag=
edObjects" call done on the backend service which returns 102 sensors in ou=
r case irrespective of the number of sensors present on the requested chass=
is.
Code Ref: https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/se=
nsors.hpp#L2471

Because of this issue problem, we are noticing significant perf drop when u=
sing $expand
8. Total time to query individual Sensors URI(101) : 3.08secs
9. Total time to query sensors with $expand(24 URIs) : 12secs



We would like to know
1. Is this the correct current behaviour with bmcweb.
2. if community is also experiencing similar performance drop with case men=
tioned above and what has been done to resolve it ?
Also like to know if any recent $expand enhancement done in the sensor area=
 which might help with performance issue, please do let me know.

--_000_CY5PR12MB6083E003B72438968F80D7D0CC609CY5PR12MB6083namp_
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would like to get feedback on following performan=
ce issue that we have observed with $expand on /redfish/v1/Chassis/&lt;Chas=
sisId&gt;/Sensors URI compared to using GET on individual Sensor URI (/redf=
ish/v1/Chassis/&lt;ChassisId&gt;/Sensors/&lt;SensorName&gt;)
 on some Chassis<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Little bit background about the system:<o:p></o:p></=
p>
<p class=3D"MsoNormal">1. No of Sensors present on the Chassis_X(where we s=
ee performance drop with $expand) : 7 sensors<o:p></o:p></p>
<p class=3D"MsoNormal">2. No of Sensors present on the Chassis_Y(where we D=
ONOT see the performance drop $expand): 31 sensors<o:p></o:p></p>
<p class=3D"MsoNormal">3. We have a common service that host 24 Chassis (in=
cluding Chassis_X, Chassis_Y)<o:p></o:p></p>
<p class=3D"MsoNormal">4. Total No of Sensors supported by service that hos=
t 24 Chassis instances: 102<o:p></o:p></p>
<p class=3D"MsoNormal">5. Time it took with $expand on Chassis_X sensors: 0=
.48secs('/redfish/v1/Chassis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')<o=
:p></o:p></p>
<p class=3D"MsoNormal">6. Total time taken by querying 7 sensors(present on=
 Chassis_X) URI: 0.6secs<o:p></o:p></p>
<p class=3D"MsoNormal">6. Time it took with $expand on Chassis_Y sensors: 0=
.48secs('/redfish/v1/Chassis/Chassis_X/Sensors?$expand=3D*($levels=3D1)')<o=
:p></o:p></p>
<p class=3D"MsoNormal">7. Total time taken by querying 31 sensors(present o=
n Chassis_y) URI: 0.91secs<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We see advantage of using $expand on Chassis_Y but n=
ot on Chassis_X.<o:p></o:p></p>
<p class=3D"MsoNormal">And Based on our analysis on $expand, looks like per=
formance of $expand on sensors is tied to the number of sensors hosted by b=
ackend service and not by the number of sensors present on a Chassis. This =
is because of &quot;GetManagedObjects&quot;
 call done on the backend service which returns 102 sensors in our case irr=
espective of the number of sensors present on the requested chassis.<o:p></=
o:p></p>
<p class=3D"MsoNormal">Code Ref: <a href=3D"https://github.com/openbmc/bmcw=
eb/blob/master/redfish-core/lib/sensors.hpp#L2471">
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#=
L2471</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Because of this issue problem, we are noticing signi=
ficant perf drop when using $expand<o:p></o:p></p>
<p class=3D"MsoNormal">8. Total time to query individual Sensors URI(101) :=
 3.08secs<o:p></o:p></p>
<p class=3D"MsoNormal">9. Total time to query sensors with $expand(24 URIs)=
 : 12secs<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would like to know <o:p></o:p></p>
<p class=3D"MsoNormal">1. Is this the correct current behaviour with bmcweb=
.<o:p></o:p></p>
<p class=3D"MsoNormal">2. if community is also experiencing similar perform=
ance drop with case mentioned above and what has been done to resolve it ?<=
o:p></o:p></p>
<p class=3D"MsoNormal">Also like to know if any recent $expand enhancement =
done in the sensor area which might help with performance issue, please do =
let me know.<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY5PR12MB6083E003B72438968F80D7D0CC609CY5PR12MB6083namp_--
