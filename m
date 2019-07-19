Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C326E13B
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 08:54:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhZm0LpVzDqth
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 16:54:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhZ81zsqzDqgW
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 16:54:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J6regv060993
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 02:54:21 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tu5y6ewrw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 02:54:21 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 19 Jul 2019 07:54:19 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 19 Jul 2019 07:54:17 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6J6sGTb59310178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jul 2019 06:54:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D3C411C04A;
 Fri, 19 Jul 2019 06:54:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBFA511C050;
 Fri, 19 Jul 2019 06:54:15 +0000 (GMT)
Received: from [9.122.210.251] (unknown [9.122.210.251])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jul 2019 06:54:15 +0000 (GMT)
Subject: Re: Integrate collectd with OpenBMC
To: Kun Yi <kunyi@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 19 Jul 2019 12:24:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------358A976CF1BE0A1384AA8CD3"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071906-0028-0000-0000-00000385F109
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071906-0029-0000-0000-000024461D11
Message-Id: <e7d30eb4-c9da-bc33-82c6-515634e64ace@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907190076
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
Cc: Gabriel Matute <gmatute@google.com>, Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------358A976CF1BE0A1384AA8CD3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kun,

I support approach:1 as it's more collectd standard. IMO, using "C" 
should be fine if that makes more sense.

For example: https://github.com/openbmc/pldm/tree/master/libpldm is in 
C, so it can be used elsewhere.

btw, for your approach:2, how is this daemon first getting the data from 
collectd before it can translate.

!! Vishwa !!

On 6/28/19 11:21 AM, Kun Yi wrote:
> Hello there,
>
> In the context of reporting BMC performance metrics, my intern Gabriel 
> (cc'ed here) and I have started looking at integrating collectd as a 
> metrics collection tool on OpenBMC. We have got it running, which is 
> trivial, but the next question is how to report the data.
>
> We have thought about it and thinks implementing a D-Bus interface to 
> be the most flexible approach. At first, we could implement a snapshot 
> (instantaneos read) interface. It would then be fairly straightforward 
> to add them as Redfish/IPMI sensors.
>
> There are two ways to do this:
> 1. Implement as a collectd "D-Bus" plugin [1]. Collectd supports 
> writing custom plugins which are C files calling the internal plugin 
> APIs. Could probably use sdbus to implement.
>
> + could potentially be upstreamed to collectd
> - the code probably will live in a downstream fork first, and if it 
> doesn't end up upstream, maintaining could become an issue since 
> collectd plugin API is not guaranteed stable
> - C
>
> 2. Implement as an interposer daemon that translates between one of 
> the formats that collectd supports (unix socket, plaintext, RRDTool..) 
> to D-Bus
>
> + project could be purely OpenBMC
> + can use sdbusplus
> - another daemon
>
> Any advice on this? Currently we are leaning towards the first 
> approach, but do you agree the D-Bus plugin is general enough to be of 
> interest to the upstream collectd community?
>
> I can definitely reach out to the collectd group but just want to ask 
> here first :)
>
> [1] Collectd plugins: 
> https://collectd.org/wiki/index.php/Plugin_architecture
> -- 
> Regards,
> Kun

--------------358A976CF1BE0A1384AA8CD3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Kun,</p>
    <p>I support approach:1 as it's more collectd standard. IMO, using
      "C" should be fine if that makes more sense. <br>
    </p>
    <p>For example: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/pldm/tree/master/libpldm">https://github.com/openbmc/pldm/tree/master/libpldm</a>
      is in C, so it can be used elsewhere.</p>
    <p>btw, for your approach:2, how is this daemon first getting the
      data from collectd before it can translate.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 6/28/19 11:21 AM, Kun Yi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hello there,<br clear="all">
        <div><br>
        </div>
        <div>In the context of reporting BMC performance metrics, my
          intern Gabriel (cc'ed here) and I have started looking at
          integrating collectd as a metrics collection tool on OpenBMC.
          We have got it running, which is trivial, but the next
          question is how to report the data.</div>
        <div><br>
        </div>
        <div>We have thought about it and thinks implementing a D-Bus
          interface to be the most flexible approach. At first, we could
          implement a snapshot (instantaneos read) interface. It would
          then be fairly straightforward to add them as Redfish/IPMI
          sensors.</div>
        <div><br>
        </div>
        <div>There are two ways to do this:</div>
        <div>1. Implement as a collectd "D-Bus" plugin [1]. Collectd
          supports writing custom plugins which are C files calling the
          internal plugin APIs. Could probably use sdbus to implement.</div>
        <div><br>
        </div>
        <div>+ could potentially be upstreamed to collectd</div>
        <div>- the code probably will live in a downstream fork first,
          and if it doesn't end up upstream, maintaining could become an
          issue since collectd plugin API is not guaranteed stable</div>
        <div>- C</div>
        <div><br>
        </div>
        <div>2. Implement as an interposer daemon that translates
          between one of the formats that collectd supports (unix
          socket, plaintext, RRDTool..) to D-Bus</div>
        <div><br>
        </div>
        <div>+ project could be purely OpenBMC<br>
        </div>
        <div>+ can use sdbusplus</div>
        <div>- another daemon</div>
        <div><br>
        </div>
        <div>Any advice on this? Currently we are leaning towards the
          first approach, but do you agree the D-Bus plugin is general
          enough to be of interest to the upstream collectd community?</div>
        <div><br>
        </div>
        <div>I can definitely reach out to the collectd group but just
          want to ask here first :)</div>
        <div><br>
        </div>
        <div>[1] Collectd plugins: <a
            href="https://collectd.org/wiki/index.php/Plugin_architecture"
            moz-do-not-send="true">https://collectd.org/wiki/index.php/Plugin_architecture</a></div>
        -- <br>
        <div dir="ltr" class="gmail_signature"
          data-smartmail="gmail_signature">
          <div dir="ltr">Regards,
            <div>Kun</div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------358A976CF1BE0A1384AA8CD3--

