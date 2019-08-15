Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0418F75C
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 01:03:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468hnl16Y9zDr7L
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 09:03:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468hn64K7kzDqyj
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 09:02:49 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FMw8IU031489; Thu, 15 Aug 2019 19:02:24 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2udfac2ns6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 19:02:24 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7FMxiVN031543;
 Thu, 15 Aug 2019 23:02:23 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2ucr3q7xch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 23:02:23 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7FN2MSm16318824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 23:02:22 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBDF6B206B;
 Thu, 15 Aug 2019 23:02:22 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0AACB205F;
 Thu, 15 Aug 2019 23:02:22 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Aug 2019 23:02:22 +0000 (GMT)
Subject: Re: Policy on Tools Posting
To: Wilfred Smith <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <mailman.545.1565898074.372.openbmc@lists.ozlabs.org>
 <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c20c680c-45af-7b5f-129a-00b053516ed5@linux.ibm.com>
Date: Thu, 15 Aug 2019 18:02:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150219
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


On 8/15/19 4:57 PM, Wilfred Smith wrote:
> My manager (Sai) is asking whether there is precedence for having utilities posted outside the OpenBMC repository. Do we want 100 OpenBMC tools repositories, each managed differently or 1 harmonized repository?
>
> Separately, is there any effort to create a “common core” for OpenBMC such that an effort akin to POSIX or the Single UNIX Specification isn’t needed ten years from now? Without standard API (or at least abstracted tools) for things like where FRU information is located or sending IPMB commands, isn’t the market for innovative software stifled (Android software market vs iOS, or even Linux vs Windows)?

My view is to focus on enhancing the Redfish functions so that users of 
OpenBMC systems can do everything they need to without having use Secure 
Shell (ssh) or any of the command line utilities ssh can access (such as 
systemctl, busctl, or obmctool).  See some publicly-readable IBM 
discussion on this topic here: https://github.com/ibm-openbmc/dev/issues/612

Meanwhile, when us developers need to access the BMC via ssh, we are 
happy to use the existing command line utilities and don't see the need 
for any more.

I would prefer to see our energy focused on enhancements to Redfish and 
on utilities which use the Redfish APIs (akin to redfishtool).

- Joseph

>
> Wilfred
>
>> On Aug 15, 2019, at 12:41 PM, openbmc-request@lists.ozlabs.org wrote:
>>
>> Send openbmc mailing list submissions to
>> 	openbmc@lists.ozlabs.org
>>
>> To subscribe or unsubscribe via the World Wide Web, visit
>> 	https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.ozlabs.org_listinfo_openbmc&d=DwICAg&c=5VD0RTtNlTh3ycd41b3MUw&r=-ektT-tD9zf2rfUisE63RqiDagGyhGey2hbEGa-47kc&m=CsXIqDLC_9ZYrVSwNllcHo7GjqAG9mj2S6NymPQTblk&s=_RrYmmMf-6XU6r5LsXsWLj8G0K_qaWyo6K2yDU5JGu8&e=
>> or, via email, send a message with subject or body 'help' to
>> 	openbmc-request@lists.ozlabs.org
>>
>> You can reach the person managing the list at
>> 	openbmc-owner@lists.ozlabs.org
>>
>> When replying, please edit your Subject line so it is more specific
>> than "Re: Contents of openbmc digest..."
>>
>>
>> Today's Topics:
>>
>>    1. Re: Policy on Tools Posting (Vijay Khemka)
>>    2. [PATCH dev-5.2] fsi: scom: Don't abort operations for minor
>>       errors (Eddie James)
>>    3. Re: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum
>>       (David Miller)
>>    4. Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System
>>       power supply driver (Guenter Roeck)
>>
>>
>> ----------------------------------------------------------------------
>>
>> Message: 1
>> Date: Thu, 15 Aug 2019 19:07:26 +0000
>> From: Vijay Khemka <vijaykhemka@fb.com>
>> To: Andrew Geissler <geissonator@gmail.com>, Wilfred Smith
>> 	<wilfredsmith@fb.com>
>> Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
>> Subject: Re: Policy on Tools Posting
>> Message-ID: <68929B76-8826-4DAD-A29E-DF7A119D00C5@fb.com>
>> Content-Type: text/plain; charset="utf-8"
>>
>>
>>
>> ?On 8/15/19, 5:59 AM, "openbmc on behalf of Andrew Geissler" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of geissonator@gmail.com> wrote:
>>
>>     On Mon, Aug 12, 2019 at 7:58 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>>>
>>> 1. Are there guidelines/procedures specific to submitting command line tools and utilities? I have heard that there may be a repository and/or path dedicated to CLI tools.
>>     The community has definitely tended to limit wrapper tools within
>>     OpenBMC. We had a discussion a while back that we're open to some but
>>     the API's to them really need to be thought out and reviewed because
>>     command line tools become customer API's (i.e. people start writing
>>     scripts on top of these tools that then become key to the
>>     manufacturing process or some other critical area).
>>
>>     Anything that goes into OpenBMC needs to support OpenBMC interfaces.
>>     For example, I'm not familiar with fruid-util's D-bus service
>>     xyz.openbmc_project.FruDevice. A "busctl tree
>>     xyz.openbmc_project.Inventory.Manager | cat" shows the inventory items
>>     on OpenBMC.
>>
>>     One issue we have within OpenBMC is there may be different
>>     implementations of the D-bus API's for a given area. For example,
>>     Inventory has different implementations so I'm not sure which repo
>>     would best fit your tool. That type of issue leads me to wonder if we
>>     should put the tools with the interface definitions in
>>     openbmc/phosphor-dbus-interfaces? Or maybe a separate phosphor-tools
>>     repo would be more logical for these.
>> Andrew, I like the idea of having phosphor-tools which can be a placeholder
>> for any commandline tools and can grow as per requirement. Currently
>> it can start with 3 proposed tools.
>>
>>     Either way, I think command line tools should each get their own
>>     mini-design doc
>>     (https://github.com/openbmc/docs/blob/master/designs/design-template.md)
>> Wilfred, Can you please create a document as per this design template and submit for review.
>>
>>     with requirements and interfaces clearly defined for review by the
>>     community. If we can find a generic tool that multiple people find
>>     useful, we can then find a place to put it. Otherwise, you could host
>>     your tools outside of openbmc/ github and just pull them into recipes
>>     from within your meta-facebook layer.
>>
>>> Thanks in advance,
>>>
>>> Wilfred
>
...snip...

