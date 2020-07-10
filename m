Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E572D21B4A3
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 14:02:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3BVb3KFPzDrNr
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 22:02:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3BTh4PNJzDrK0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 22:01:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ABWC1h049762
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 08:01:23 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326f1bwfph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 08:01:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ABkmnf022768
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 326bc909ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06ABxuuu56951102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 11:59:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FF2AA4051
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D584A4055
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.208.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 12:01:17 +0000 (GMT)
Subject: Re: Why IPv6AcceptRA is disabled in phosphor-network
To: openbmc@lists.ozlabs.org
References: <6213f03910e14149a6964234961ae193@quantatw.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <94f3de2f-f048-6fea-35c3-6b2b8d6d3239@linux.vnet.ibm.com>
Date: Fri, 10 Jul 2020 17:31:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6213f03910e14149a6964234961ae193@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_04:2020-07-10,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=387 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100079
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

Hi David,

On 7/7/20 4:39 PM, David Wang (¤ý®¶¦t) wrote:
> Hi all,
>    I want to set DHCPv6 to enable by default in my BMC.
> That is, I can delete /etc/systemd/network/00-bmc-eth*.network
> and reboot and still have DHCPv6 reachable.
>
> But I notice that IPv6AcceptRA is disabled in phosphor-network
> in order not to handle the ipv6 routing advertisement message periodically.
> See: https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/8361
Currently phosphor-networkd doesn't support SLAAC(DHCPV6, Router 
advertised address).
>
> Why we need to avoid handling RA periodically?

If you have bad router configured in network which keeps sending the 
routing prefix frequently, phopshor-networkd frequently refreshing its 
D-bus objects.It can be fixed as ignore the refreshing of the Dbus 
objects if there is a D-bus object entry for the given IP address.

> Does it cause any bad effect?
> If I want to keep the acceptance RA, how should I configure it?
> Or should I just patch "IPv6AcceptRA=true" in phosphor-network of my BMC?
If we fix the behavior as suggested above there should not be a problem.
>
> Thank you,
>
> Regards,
> David
