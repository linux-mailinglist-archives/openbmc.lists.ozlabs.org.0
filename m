Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00225159777
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 18:59:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H9Ws3mBSzDqFv
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 04:59:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H9Vz2GHnzDq6M
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 04:58:33 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BHsYWf015514
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 12:58:30 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y3wxd7u9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 12:58:29 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01BHsbit015819
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 12:58:29 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y3wxd7u9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 12:58:29 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01BHt3qR026466;
 Tue, 11 Feb 2020 17:58:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2y1mm7t4uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 17:58:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01BHwRXh52429118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Feb 2020 17:58:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22245BE053;
 Tue, 11 Feb 2020 17:58:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7282BE051;
 Tue, 11 Feb 2020 17:58:26 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.156.32])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Feb 2020 17:58:26 +0000 (GMT)
Subject: Re: Enabling OpenBMC Debug
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <27a538db-96e4-f83f-6541-93e974f78ead@linux.ibm.com>
Date: Tue, 11 Feb 2020 11:58:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_05:2020-02-10,
 2020-02-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110124
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

On 2/11/20 9:51 AM, Andrew Geissler wrote:
> I find myself running a lot of different commands to enable a variety of
> debug data on OpenBMC when debugging different issues (usually BIOS
> communication issues). I also end up giving these commands to a lot of people
> when recreating issues for me. Stuff like this:
>
> # enable debug logs in journal
> sed -i 's/info/debug/' /lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
> systemctl restart systemd-journald.service
>
> # Enable BIOS communication service debug
> sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
> sed -i 's/btbridged/btbridged --vv/' /lib/systemd/system/org.openbmc.HostIpmi.service
> sed -i 's/ipmid/ipmid -d 0xff/'  /lib/systemd/system/phosphor-ipmi-host.service
> sed -i 's/0/1/' /etc/default/pldmd
> systemctl daemon-reload
> systemctl restart mboxd.service
> systemctl restart org.openbmc.HostIpmi.service
> systemctl restart phosphor-ipmi-host.service
> systemctl restart pldmd.service
>
> I was contemplating wrapping the above stuff in a obmcutil command so instead
> of telling people to do all of the above (and dealing with situations when
> those commands change), I could say something like run "obmcutil debugon".
>
> Any thoughts out there? Would finer granularity of the debug be useful?
> Are there other forms of debug people would like enabled?

Thank you for the information.  I keep learning all the time.

These settings factor into service scenarios and also deployment 
readiness.  For example:
- I want to turn off debug.  For example, I want a debug-off command.
- I would want a way to validate (or at least show) these settings when 
testing firmware image release candidates.  For example, another 
obmcutil command "debug-show" which uses "grep -H" instead of "sed".
- I would want some documentation added the BMC administrator's guide to 
make them aware of OpenBMC debug support.  Draft: The obmcutil command 
can control debug settings for a variety of the components running on 
the BMC.  For more information, see 
https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil

The obmcutil tool is a shell script, so folks can take just the pieces 
they need.  That is, don't be more granular at this time.

In summary, it seems like a good idea.  It seems like we should ask our 
service architects to weight in.  I'll go ask mine....

- Joseph

>
> Andrew

