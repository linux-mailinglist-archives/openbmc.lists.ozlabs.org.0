Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2492EB161
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:29:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9KH35pQWzDqg6
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:29:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S3hhEkJ+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9KGG0Nn7zDqYk
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:28:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 105H2vIi081341; Tue, 5 Jan 2021 12:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NGff0IThS/TaatIUMZYfZfstpjKf2w9ZDncwqoXpQ+A=;
 b=S3hhEkJ+zMeO6ZMLuY2I9Z2RoEhhDCiD9bNTxkZrepRsWuQmwUmS4Ezd6BMKuPNYNvtf
 iqh6Inmgc2sXKGMqTnfomXMflgSVCzvThCIQctwr6Ptmx3/2+7T2zaJjwGg/itwaw4qc
 +pXpwN2vQug2q5dw0veT5071NKsCFijHQhzPfVid4GxQAM/V3Xj/fazJUk0TFvTQQt/O
 iX0caayiKuG0Hm13/mKoc9s4ncb6Vqjt4LHBJduEcdimszaMZ2kMbquCK/AasYjET1l0
 unne4Q9kq02R5L5ygkJ+ez9X0i6m4XkGCnVv0BWPcHK/kP0qXrfpkseHNJdCSI2wR0YL fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vu7eahun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 12:28:18 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 105H3F5R082187;
 Tue, 5 Jan 2021 12:28:17 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vu7eahu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 12:28:17 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 105HRYnQ022139;
 Tue, 5 Jan 2021 17:28:16 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 35tgf9d1s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 17:28:16 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 105HSFqL28967404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Jan 2021 17:28:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0A506E050;
 Tue,  5 Jan 2021 17:28:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241356E04C;
 Tue,  5 Jan 2021 17:28:15 +0000 (GMT)
Received: from [9.160.22.70] (unknown [9.160.22.70])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Jan 2021 17:28:14 +0000 (GMT)
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
 <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
 <CAJTGxZGj9YVLHVrJeW3vcDD1EkA+e44VxxrH9BkvH2mF03WEYg@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <c881203e-8d2a-5516-772d-569e2c9110fb@linux.ibm.com>
Date: Tue, 5 Jan 2021 11:28:15 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTGxZGj9YVLHVrJeW3vcDD1EkA+e44VxxrH9BkvH2mF03WEYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_05:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050101
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/5/2021 11:18 AM, Vijay Khemka wrote:
> I have a basic question, what are we trying to achieve here. 1....
> This Message Is From an External Sender
> This message came from outside your organization.
>
> I have a basic question, what are we trying to achieve here.
> 1. Are we avoiding of using PVS here completely or
> 2. we don't want to define separate json config for PVS
>
> because in my understanding PVS will work straight forward
> if we define expression in PVS config file.
>

My goal was to simply have PVS get its config from entity-manager D-Bus, 
so that when we add support for new systems we just put the config in an 
entity-manager JSON file we need anyway (and also because we support 
multiple systems in the same flash image which may have different sensors).

I actually had this coded and working, but having the expression come 
from entity manager was rejected (see 
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/38707), 
and so this is the compromise.


> Regards
> -Vijay
>
> On Tue, Jan 5, 2021 at 7:58 AM Matt Spinler <mspinler@linux.ibm.com 
> <mailto:mspinler@linux.ibm.com>> wrote:
>
>
>
>     On 1/5/2021 8:27 AM, Patrick Williams wrote:
>     > On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
>     >> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
>     >>> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler
>     <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>
>     >>> <mailto:mspinler@linux.ibm.com
>     <mailto:mspinler@linux.ibm.com>>> wrote:
>     >>>
>     >>>      I need a median of some sensor values, where this median
>     sensor has
>     >>>      threshold interfaces
>     >>>      whose values must be defined in entity-manager.  Since exprtk
>     >>>      expressions are not allowed in
>     >>>      entity-manager, I cannot just port the PVS's JSON config
>     into an
>     >>>      entity-manager config.
>     >>>
>     >>> I missed this discussion but why can't we simply use virtual
>     sensor as
>     >>> expertk provides median function and we have threshold support for
>     >>> each virtual sensor. Please help, if I am missing anything.
>     >> If you're asking why can't we just have PVS get its exprtk
>     expression to
>     >> use from entity-manager, and encode the median there, it's
>     because Ed
>     >> doesn't want exprtk in entity-manager config files (I'll defer
>     to him on
>     >> the reasons).
>     > As part of offline discussions on this I said that having a
>     one-off EM
>     > config for median to allow you to make progress is reasonable, but I
>     > don't think having a bunch of one-offs is a viable long-term
>     solution
>     > for phosphor-virtual-sensors.  Basically we're kicking the can
>     down the
>     > road until we have a better understanding of what kinds of EM/PVS
>     > configs we're going to need.
>     >
>     >> If you're asking now that the median function is hardcoded, why
>     write it in
>     >> C++ instead of exprtk, it's because the exprtk code would be so
>     similar to
>     >> C++ code (skip the bad values, put the sensors in a vector,  call
>     >> nth_element)
>     >> that writing it in exprtk doesn't really buy us anything, and
>     using C++ lets
>     >> me skip making the symbol table.
>     > I would certainly prefer we use the exprtk code here. You should be
>     > able to generate (at runtime) a exprtk expression from the EM
>     config you
>     > specified below.
>     >
>     > My rationale is:
>     >      * Ed suggested that a long-term answer might be a few
>     lookup tables
>     >        / transformations from the EM configs to the PVS
>     expressions.  I'm
>     >        not fully bought into this yet but it seems like a reasonable
>     >        direction to explore.
>     >
>     >      * You wrote "because the exprtk code would be so similar to
>     the C++
>     >        code", which is why you *should* do it in exprtk. The
>     rest of the
>     >        PVS code is already this way so why something different and
>     >        require dual maintanence?  If the exprtk-based support
>     code is
>     >        missing some of these features, lets add them because
>     others will
>     >        likely need them as well.
>
>     See below.
>
>     >>>      Instead, I will make a new entity-manager config that
>     will have the
>     >>>      component sensors
>     >>>      along  with the thresholds to use, with a subtype of
>     median, vaguely
>     >>>      something like:
>     >>>
>     >>>      {
>     >>>      Type: "VirtualSensor"
>     >>>      Name: "MySensorName"
>     >>>      Subtype: "Median"
>     >>>      Sensors: [ "Sensor1", "Sensor2", .... ]
>     >>>      ThresholdsWithHysteresis [ ]
>     >>>      minInput: 0
>     >>>      maxInput: 100
>     >>>      }
>     >>>
>     > I would expect the 'exprtk' expression from your EM config to be
>     > something like "median(Sensor1, Sensor2...)".  You should be able to
>     > feed this into the existing virtual-sensor constructors and not
>     have to
>     > make the symbol table yourself.
>
>     Every variable used by exprtk needs to be added to the symbol table
>     first by the C++.
>
>     Also, we need a slightly tweaked median of our 3 ambient temp sensors:
>     1) throw out values outside of minInput/maxInput
>     2) if there is an even number, because we threw out one, choose the
>     higher value, and
>          don't do the average of the 2  that I believe an actual median
>     would use.
>     3) if we threw out all 3 (very unlikely), use NaN as the sensor value.
>
>     This is easy to do in C++ using std::nth_element, and basically looks
>     the same in
>     exprtk which is why I suggested just using C++ though I don't really
>     care that much either way,
>     but I don't see how we could upstream this as a true median().  In
>     fact,
>     since
>     the underlying code would just use  nth_element anyway, I'm not even
>     sure it would
>     be accepted and is probably why there isn't already a median().
>
>     Since I guess it could be argued this isn't a true median, maybe we
>     shouldn't call it
>     a median, which is fine, but we still need it.
>
>     > Exprtk doesn't currently support a 'median' operator but it does
>     support
>     > 'avg'.  We should contribute this upstream and add as a patch in the
>     > meantime.
>     >
>

