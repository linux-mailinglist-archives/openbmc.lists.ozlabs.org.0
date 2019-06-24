Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93D52173
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 06:01:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XssW557PzDqT5
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 14:01:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=paul.vancil@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="MP3p1OZG"; 
 dkim-atps=neutral
X-Greylist: delayed 30395 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Jun 2019 14:00:38 AEST
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xsrk53yKzDqSy
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 14:00:36 +1000 (AEST)
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OJUBTa026894
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 15:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=8kVXmhg+Fu5sIZ5HJP1a8UKPHk+0O67IM3naPtVfM5k=;
 b=MP3p1OZGduf8S8n6CmCy8+4dAsirTqgGB1iaiYVxeuyMOVCbFR9TbUUvF9w6xe5B3WzW
 R5YcrX77r2/6xhucLIYjUhcIlUtKJiyfJSsL/2ZlN3nlEE5erlDC+GMkVhnvpl3q5w+C
 M2NarE0Qivh17px8D3q0v6p74HRAuutoXfo8vegJ3vowfpQqqJpmtWXMChM8Hm3XtzNn
 +jw8eS4k4l8MuroPiEu8EdJ8IvZ9kylOI4dzvD3ggYI8aedRpfODt2uqoMoaFRGes7v8
 mo2aI3whjOou5WAdGuMPkK3YrdWHeKAn/OcoiaCfQCw7moiKIq6Xg5uviSCky9PGurhi BA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2t9ddrs6f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 15:33:56 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OJXQ6F026529
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 15:33:55 -0400
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com
 [143.166.85.207])
 by mx0a-00154901.pphosted.com with ESMTP id 2tb23ujva8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 15:33:55 -0400
X-LoopCount0: from 10.166.135.97
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,346,1549951200"; d="scan'208";a="1260479953"
From: <Paul.Vancil@dell.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Platform telemetry and health monitoring
Thread-Topic: Platform telemetry and health monitoring
Thread-Index: AdUqvr91HvDeXicmSfWb6F6uAhq+3w==
Date: Mon, 24 Jun 2019 19:33:52 +0000
Message-ID: <742cb5ad955a42518e15c0c68ed06f94@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240156
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240155
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

Re Redfish support for Telemetry,
Deepak noted that Redfish had a Telemetry schema that is a work-in-progress=
 (wip).
Actually, Redfish Telemetry was release as part of the 2018.2 release in Au=
gust 2018, and is being implemented by some BMCs now.
See:  https://www.dmtf.org/content/new-redfish-release-adds-openapi-30-supp=
ort-telemetry
And  https://www.dmtf.org/sites/default/files/Redfish_2018_Release_2_Overvi=
ew.pdf    (slides 2, 7 )
The White Paper Deepak referred to was released as a wip earlier in the yea=
r.   It was not updated but is accurate as a general overview.
There is a public-telemetry-mockup that is nice for understanding the model=
, but not yet published.   We could push them to do that soon.
In Redfish, there are:
   --MetricDefinitions -- that define a metric property (eg minimumConsumed=
Watts being the min of power consumption over an interval)
   --MetricReportDefinitions -- define a metric report consisting of a set =
of MetricProperties, what triggers the generation of the report (eg schedul=
ed, on trigger...), and how to send the report (log to metricReports Collec=
tion, send RedfishEvent, etc)
   --MetricReports -- the report --which can is logged or sent as an event
   --MetricTriggers -- defines triggers can can trigger a metric report cre=
ation eg a sensor crossing a threshold etc

Metric data can be collected by the BMC, and then read by a client with Red=
fish GET requests, or can be sent autonomously as RedfishEvents.

The data is JSON encoded and formatted along the lines of Redfish responses=
, but the reports generally only contains the relevant telemetry data (with=
 minimal describing metadata) since the descriptive metadata is all defined=
 by the MetricReportDefinitions and MetricDefinitions that are associated w=
ith the report.
=20
The Redfish Telemetry model is very general in nature I think--and thus sup=
ports about any type of metric or telemetry data one might want.
So this is worth a strong consideration as the basis for OpenBMC telemetry.

Note that the model does support allowing users to define metric reports (b=
ased on supported Redfish properties), however it does not require allowing=
 users to define custom reports (which could be complicated to implement).
I think most early implementations will support some set of pre-defined Met=
ricReportDefinitions.
However the DMTF has not officially published any 'standard' Report Definit=
ions.

Thanks,  Paul Vancil   --Dell ESI


----------------------------------------------------------------------

Message: 1
Date: Thu, 20 Jun 2019 14:54:35 +0530
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: Neeraj Ladkani <neladk@microsoft.com>, OpenBMC Maillist
	<openbmc@lists.ozlabs.org>
Subject: Re: Platform telemetry and health monitoring
Message-ID: <582a29cf-e3bf-f7d3-2e78-c743c3a6a2d2@linux.vnet.ibm.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 19/06/19 11:11 AM, Neeraj Ladkani wrote:
> In last meeting, we discussed that telemetry data can be collected=20
> using ?tools? and exported using binary ?blobs?,
>=20
> Should we define a standard data format so that information can be parsed=
 through standard mechanism and help taking specific actions.
>=20
> Host CPU
> Memory
> Network Adapter
> GPUs/IPUs
> BMCs
>=20

Redfish has a work-in-progress [1] Telemetry schema, and I believe via this=
 schema, one can pull out telemetry information, as well as have the BMC pu=
sh out Telemetry information via server-sent events. Are you looking at thi=
s as an option?

[1]
https://www.dmtf.org/documents/redfish-spmf/redfish-telemetry-white-paper-0=
10a

Regards,
Deepak

> Thanks
> Neeraj


