Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A929DD60
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 07:59:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HdVl25vZzDqpK
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 15:59:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HdV14YCfzDqlL
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 15:58:48 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7R5vmQx035279
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 01:58:44 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2umwcyaswm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 01:58:44 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 27 Aug 2019 06:58:41 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 06:58:40 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7R5wdex35979310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 05:58:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2B7742042
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 05:58:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6841242041
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 05:58:38 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 05:58:38 +0000 (GMT)
Subject: Re: custom ntp server in phosphor-networkd
To: openbmc@lists.ozlabs.org
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Tue, 27 Aug 2019 11:28:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826172315.GB45301@mauery.jf.intel.com>
Content-Type: multipart/alternative;
 boundary="------------9CC7E58B5D2296426007A1FC"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19082705-0008-0000-0000-0000030DBA6B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082705-0009-0000-0000-00004A2BF4F7
Message-Id: <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270067
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

This is a multi-part message in MIME format.
--------------9CC7E58B5D2296426007A1FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/19 10:53 PM, Vernon Mauery wrote:
> On 26-Aug-2019 07:25 PM, Alexander A. Filippov wrote:
>> Our customers complain that they can't set custom ntp while dhcp is enabled on
>> bmc network interface.
>>
>> I found out that the phosphor-networkd doesn't allow it in fact and it awaits
>> the list of ntp-servers in response from dhcp server. When BMC is configured
>> with a static IP address phosphor-networkd keep a list of ntp-service in the
>> configuration file of the network interface. In my opinion it is wrong.
Why this is wrong, Following are the rules for adding the NTP servers
The NTP server to be used will be determined using the following rules:

  * Any per-interface NTP servers obtained
    from|systemd-networkd.service(8)|configuration or via DHCP take
    precedence.
  * The NTP servers defined in|/etc/systemd/timesyncd.conf|will be
    appended to the per-interface list at runtime and the daemon will
    contact the servers in turn until one is found that responds.
  * If no NTP server information is acquired after completing those
    steps, the NTP server host names or IP addresses defined
    in|FallbackNTP=|will be used



I don't see a problem in adding the NTP servers in the networkd.conf, 
Spec also suggest the same.

https://wiki.archlinux.org/index.php/systemd-timesyncd

Administrator may/not configure the DHCP server with NTP servers, To 
make it simple we put a check that if DHCP is enabled then don't allow 
the NTP server configuration.

If we have a scenario where DHCP server is configured as "Don't send the 
NTP Server" and we want the NTP server we have two ways

=> Either ask the admin to make the changes in the DHCP server to supply 
the NTP server.

=> We may allow the NTP server configuration even if the interface mode 
is DHCP.

> This is pretty common behavior for DHCP settings. The DHCP server can
> respond with all sorts of settings beyond just the ip/netmask/gateway.
> NTP, DNS, TFTP (for PXE), etc., are all things that might get returned
> by the DHCP server. Generally, if you are using DHCP, you just accept
> those responses and use them because you assume that the network
> administrator did the right thing and set them up.
I agree with vernon and that was the intention behind the
>
>> I propose to change this behavior:
>>   - the list of ntp-service should be kept in /etc/systemd/timesyncd.conf
>>   - the customization of ntp-servers should be independent from the network
>>     inferface configuration.
>>
> It seems to me that if you are using static settings for your network,
> then you would also have static (or user-supplied) settings for NTP and
> DNS. But if you are using DHCP for the network, it would make sense to
> use the NTP and DNS settings supplied by the DHCP server.
>
> Now it might also be nice to have some reasonable defaults for NTP
> servers. It is not uncommon to have IP gateways also be NTP servers, so
> it might be reasonable to attempt to use the gateway as an NTP server if
> none was specified in the DHCP response. I don't like the idea of
> setting the default NTP server to be something that is globally
> addressable because that makes the assumption that the BMC can reach
> global networks, which should not be the case.
>
> --Vernon

--------------9CC7E58B5D2296426007A1FC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 26/08/19 10:53 PM, Vernon Mauery
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190826172315.GB45301@mauery.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">On 26-Aug-2019 07:25 PM, Alexander A. Filippov wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Our customers complain that they can't set custom ntp while dhcp is enabled on
bmc network interface.

I found out that the phosphor-networkd doesn't allow it in fact and it awaits
the list of ntp-servers in response from dhcp server. When BMC is configured
with a static IP address phosphor-networkd keep a list of ntp-service in the
configuration file of the network interface. In my opinion it is wrong.</pre>
      </blockquote>
    </blockquote>
    <tt>Why this is wrong, Following are the rules for adding the NTP
      servers</tt><br>
    <tt>The NTP server to be used will be determined using the following
      rules:</tt>
    <ul style="list-style-type: disc; margin: 0.3em 0px 0px 1.6em;
      padding: 0px; list-style-image: none; color: rgb(34, 34, 34);
      font-size: 14px; font-style: normal; font-variant-ligatures:
      normal; font-variant-caps: normal; font-weight: 400;
      letter-spacing: normal; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
      255); text-decoration-style: initial; text-decoration-color:
      initial;">
      <li style="margin-bottom: 0.1em;"><tt>Any per-interface NTP
          servers obtained from</tt><tt><span> </span></tt><code
          style="color: rgb(34, 34, 34); background-color: rgb(235, 241,
          245); border: 0px solid rgb(234, 236, 240); border-radius:
          0px; padding: 0px 0.3em; display: inline-block;">systemd-networkd.service(8)</code><tt><span> </span></tt><tt>configuration
          or via DHCP take precedence.</tt></li>
      <li style="margin-bottom: 0.1em;"><tt>The NTP servers defined in</tt><tt><span> </span></tt><code
          style="color: rgb(34, 34, 34); background-color: rgb(235, 241,
          245); border: 0px solid rgb(234, 236, 240); border-radius:
          0px; padding: 0px 0.3em; display: inline-block;">/etc/systemd/timesyncd.conf</code><tt><span> </span></tt><tt>will
          be appended to the per-interface list at runtime and the
          daemon will contact the servers in turn until one is found
          that responds.</tt></li>
      <li style="margin-bottom: 0.1em;"><tt>If no NTP server information
          is acquired after completing those steps, the NTP server host
          names or IP addresses defined in</tt><tt><span> </span></tt><code
          style="color: rgb(34, 34, 34); background-color: rgb(235, 241,
          245); border: 0px solid rgb(234, 236, 240); border-radius:
          0px; padding: 0px 0.3em; display: inline-block;">FallbackNTP=</code><tt><span> </span></tt><tt>will
          be used</tt></li>
    </ul>
    <tt><br>
    </tt><tt><br>
    </tt><tt>I don't see a problem in adding the NTP servers in the
      networkd.conf, Spec also suggest the same.</tt><tt><br>
    </tt>
    <p><tt><a
          href="https://wiki.archlinux.org/index.php/systemd-timesyncd">https://wiki.archlinux.org/index.php/systemd-timesyncd</a><br>
      </tt></p>
    <p><tt>Administrator may/not configure the DHCP server with NTP
        servers, To make it simple we put a check that if DHCP is
        enabled then don't allow the NTP server configuration.</tt></p>
    <p><tt>If we have a scenario where DHCP server is configured as
        "Don't send the NTP Server" and we want the NTP server we have
        two ways</tt></p>
    <p><tt>=&gt; Either ask the admin to make the changes in the DHCP
        server to supply the NTP server.</tt></p>
    <p><tt>=&gt; We may allow the NTP server configuration even if the
        interface mode is DHCP.</tt><br>
    </p>
    <blockquote type="cite"
      cite="mid:20190826172315.GB45301@mauery.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is pretty common behavior for DHCP settings. The DHCP server can 
respond with all sorts of settings beyond just the ip/netmask/gateway. 
NTP, DNS, TFTP (for PXE), etc., are all things that might get returned 
by the DHCP server. Generally, if you are using DHCP, you just accept 
those responses and use them because you assume that the network 
administrator did the right thing and set them up.</pre>
    </blockquote>
    I agree with vernon and that was the intention behind the <br>
    <blockquote type="cite"
      cite="mid:20190826172315.GB45301@mauery.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I propose to change this behavior: 
 - the list of ntp-service should be kept in /etc/systemd/timesyncd.conf
 - the customization of ntp-servers should be independent from the network
   inferface configuration.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It seems to me that if you are using static settings for your network, 
then you would also have static (or user-supplied) settings for NTP and 
DNS. But if you are using DHCP for the network, it would make sense to 
use the NTP and DNS settings supplied by the DHCP server.

Now it might also be nice to have some reasonable defaults for NTP 
servers. It is not uncommon to have IP gateways also be NTP servers, so 
it might be reasonable to attempt to use the gateway as an NTP server if 
none was specified in the DHCP response. I don't like the idea of 
setting the default NTP server to be something that is globally 
addressable because that makes the assumption that the BMC can reach 
global networks, which should not be the case.

--Vernon
</pre>
    </blockquote>
  </body>
</html>

--------------9CC7E58B5D2296426007A1FC--

