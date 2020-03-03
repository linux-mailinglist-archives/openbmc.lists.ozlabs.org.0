Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024D177D58
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 18:24:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X3mB2CDHzDqW0
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 04:24:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X3lQ5hQjzDqKH
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 04:24:02 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023HKwmt145822; Tue, 3 Mar 2020 12:23:51 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknay7v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Mar 2020 12:23:48 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 023HNLIJ019624;
 Tue, 3 Mar 2020 17:23:45 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 2yffk64qt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Mar 2020 17:23:45 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 023HNi1D40501546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 17:23:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2D02C6057;
 Tue,  3 Mar 2020 17:23:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6824BC6059;
 Tue,  3 Mar 2020 17:23:44 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  3 Mar 2020 17:23:44 +0000 (GMT)
Subject: Re: obmc-console design for multi host support
To: Andrew Jeffery <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>,
 Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
 <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d999eac8-84e9-826f-1d7f-c327a8efbf89@linux.ibm.com>
Date: Tue, 3 Mar 2020 11:23:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_06:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1011 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030117
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/2/20 10:03 PM, Andrew Jeffery wrote:
> On Fri, 28 Feb 2020, at 18:00, Vijay Khemka wrote:
>> ﻿On 2/27/20, 2:05 AM, "openbmc on behalf of Andrew Jeffery"
>>      
>>      ```
>>      $ ls -1 /etc/obmc-console
>>      client.2200.conf
>>      server.ttyVUART0.conf
>>      ```
>> What are other contents of client and server conf file other than socket-id?
> Whatever else you were previously specifying for the server.
>
>>      
>>      So to map the client associated with port 2200 to the server associated
>>      with ttyVUART0 we set the same socket-id value in both files:
>>
>> Can this socket-id be any random word and can this be same across multiple
>> Host (client/server) configuration. I mean, do we need different socket-id for
>> client.2200 and client.2201 or it can be same.
> The socket-id is a unique portion for the unix domain socket created by the
> obmc-console-server instance. The server needs to know this because it needs
> to know what to name the pipe; the client needs to know it as it needs to form
> the abstract socket name to which to connect.
>
> In general unless you're looking to expose the same console on _different_
> network ports, you want to pair each client with a unique server.
>
> Here's an ASCII diagram:
>
>                 +--------------------------------------------------------------------------------------------+
>                 |                                                                                            |
>                 |       obmc-console-client      unix domain socket         obmc-console-server              |
>                 |                                                                                            |
>                 |     +---------------------+                           +------------------------+           |
>                 |     | client.2201.conf    |  +---------------------+  | server.ttyVUART1.conf  |           |
>             +---+--+  +---------------------+  |                     |  +------------------------+  +--------+-------+
> Network    | 2201 +-->                     +->+ @obmc-console.host1 +<-+                        <--+ /dev/ttyVUART1 |   UARTs
>             +---+--+  | socket-id = "host1" |  |                     |  | socket-id = "host1"    |  +--------+-------+
>                 |     |                     |  +---------------------+  |                        |           |
>                 |     +---------------------+                           +------------------------+           |
>                 |                                                                                            |
>                 |                                                                                            |
>                 |                                                                                            |
>                 +--------------------------------------------------------------------------------------------+
>
> Does that help?

Nice diagram!  Can this be added to
https://github.com/openbmc/obmc-console/blob/master/README.md

I tried to capture this network interface in an architecture review here:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27969/3/architecture/interface-overview.md#130
which also includes 'ipmi sol activate' and hostlogger.

Please let me know the best way to document this in the project?  I 
would be happy to remove details from the doc-under-review and point to 
the obmc-console README.  Does that sound right?

- Joseph

>
> Andrew

