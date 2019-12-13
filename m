Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BD11EB77
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 21:03:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZM6X0K9jzDrJq
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 07:03:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZM5L64chzDrHn
 for <openbmc@lists.ozlabs.org>; Sat, 14 Dec 2019 07:02:14 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBDJ9KKN010126; Fri, 13 Dec 2019 15:02:10 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wugd40fsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 15:02:10 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBDJl7Ou016393;
 Fri, 13 Dec 2019 15:02:10 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wugd40fs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 15:02:10 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBDK1wM2006760;
 Fri, 13 Dec 2019 20:02:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2wr3q79nce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 20:02:09 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBDK28IS40567158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 20:02:08 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5341F136061;
 Fri, 13 Dec 2019 20:02:08 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FB09136072;
 Fri, 13 Dec 2019 20:02:07 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Dec 2019 20:02:07 +0000 (GMT)
Subject: Re: Redfish: Disable/enable out of band IPMI
To: Carol Wang <karo33bug@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
Date: Fri, 13 Dec 2019 14:02:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-13_07:2019-12-13,2019-12-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130146
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
Cc: "Puli, Apparao" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/12/19 1:30 AM, Carol Wang wrote:
> Hi,
>
> Looking to implement IPMI Enable / Disable as part of Redfish's 
> Manager Network
> Protocol.
> https://redfish.dmtf.org/schemas/ManagerNetworkProtocol.v1_5_0.json

Carol, that is good.  We are also looking to implement this protocol, 
plus the ability to control other services such as Avahi service 
discovery, and SSH access to the BMC shell.  I hope we can work together.

Note that we have discussed this work in the following places:
- https://github.com/openbmc/openbmc/wiki/Security-working-group
- https://lists.ozlabs.org/pipermail/openbmc/2019-September/018379.html
- https://github.com/ibm-openbmc/dev/issues/612

With that said, I don't have an answer to your question.  Can someone 
who knows systemd help us determine the best way to disable/stop and 
re-enable/start the [phosphor-ipmi-net][2] service?  I think a D-Bus 
interface to represent the status of the service and be able to control 
it is expected.

I can help with the bmcweb implementation, if needed.

[2]: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-net_git.bb

- Joseph
> Two ways to get/set the current status of net IPMI:
> 1. Add an interface in phosphor-dbus-interface to indicate the status 
> of net IPMI.
> Have a daemon to monitor the status, if the status is changed, then 
> enable or
> disable the net IPMI service and socket.
> 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the 
> state is
> "running" or "listening", the net IPMI status is true, otherwise, the 
> status is
> false. Then bmcweb can enable or disable the service and socket.
>
> Wondering if anyone has any thoughts on this feature, which way is better.
> If add interface, in which daemon this interface should be implemented?
>
> [1] 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/network_protocol.hpp#L190
>
> Thanks,

