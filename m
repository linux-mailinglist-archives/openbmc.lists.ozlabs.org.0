Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5A580FD6
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 11:26:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsWk463ZFz3bsS
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 19:26:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bv5aWgkr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=sunithaharish04@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bv5aWgkr;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsWjZ3B3Yz3bgC
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 19:25:36 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id y15so12777770plp.10
        for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=YZnw7va039DDICauWc0kUctvFeeMkRjLVAihOYWg1cA=;
        b=Bv5aWgkrU8vC9aIjaeyqnXb22PL9G5jx6D0J9CMxB9h0PjHk8dVLfh+jbR9sIcBMXk
         ZkAxBSvIwu+zt/HK8RSCqKvq51NMdsRvKcq0BwUafmP5ss0pnLOVHbdWQRMKre3SdSlQ
         nL+q752hzqllMRfDXvZCBorB7/VEnXSF+ZlAKpijSvvZnAleNXoz5vpNqwZnrXPaNAxi
         QBP8QvympnENQQeutA1e3QNa8OpsD5b9De7oCGFIoncSyQZcGbldYjsws829hx9Ic56C
         F39+D+tsysd/VXC9E3sXM/gqcEcOpdS78mLWvbh3aECIA3xe41st7vvNUvmCz8SzoCPa
         7roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=YZnw7va039DDICauWc0kUctvFeeMkRjLVAihOYWg1cA=;
        b=5L5SWHjWgCr8zdjRYVr4MIdsPvQfFteGGrZZmlIEBccXJ+D1XlS4SlUyCbGJ23nPd8
         vCYmxKOVV9KEygAOaF56RMR4gpITGp3/Nb/nFjRc/aoQ6ddu0JukaoePvHh9PfrG35Z1
         nHkGnTr68JM6WZhTHkSOpqJnXJkcVITF9maYGuaNwCN5IBxpz8zcmQFs+Po4XtEgjXnc
         UgUe391aqzeihirn7l1Vu/ItgXDxxhfh1BdB8MJXeiQ7EQc6NEomNO9KESnAN24fKC50
         iyxHYBkZllXrje/L2+RiGLEHSOZT6T+JxOZhwLW/DJ0vgLyGGs2wB0I2hRDz9QfeJu4I
         aevg==
X-Gm-Message-State: AJIora/cz9bPugduWQgjQLdLcU1VcM8/m5/z3gWuT3AnabZch0Tq4198
	Guc0QHnhnAeJrp4lod43v6I=
X-Google-Smtp-Source: AGRyM1sU6ITgTStTG3G/yvMykj/hUJK+84Q6OQuMbG7Cjf8C2KArCjLNVQ3NrW/oddRns6PeBru3mQ==
X-Received: by 2002:a17:90b:224f:b0:1f2:9163:2088 with SMTP id hk15-20020a17090b224f00b001f291632088mr12850893pjb.17.1658827533076;
        Tue, 26 Jul 2022 02:25:33 -0700 (PDT)
Received: from [9.199.79.173] ([129.41.58.5])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b0016d1bee1519sm11009032plh.102.2022.07.26.02.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:25:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------jzQobrMKY049MUBKeSgn0sjx"
Message-ID: <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com>
Date: Tue, 26 Jul 2022 14:55:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config
 support
Content-Language: en-US
To: raviteja bailapudi <raviteja28031990@gmail.com>,
 Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
 <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------jzQobrMKY049MUBKeSgn0sjx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 23-06-2022 15:57, raviteja bailapudi wrote:
> Hi, Jiaqing
>
> We have noticed an issue while using Static IPv4 addresses on both 
> eth0 and eth1.
> We have configured a static private IP with the matching subnet of 
> Laptop Connected on eth0 andconfigured a static public IP on eth1.
> Both routes have got the metric value 0. eth0 route is the first entry 
> of the routing table which was being used for routing.
>
>
> Ping to eth1 IP <9.x.x.84> does not work and that Eth0 private IP 
> pings from the laptop connected.
>
> *IPConfig:*
>
>
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast 
> qlen 1000
>
> link/ether 08:94:ef:82:4c:76 brd ff:ff:ff:ff:ff:ff
>
> inet 169.254.7.123/16 <http://169.254.7.123/16> brd 169.254.255.255 
> scope link eth0
>
> valid_lft forever preferred_lft forever
>
> inet 10.x.x.100/24 brd 10.6.6.255 scope global eth0.—> Private IP 
> (Connected to laptop)
>
> valid_lft forever preferred_lft forever
>
> inet6 fe80::a94:efff:fe82:4c76/64 scope link
>
> valid_lft forever preferred_lft forever
>
> 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast 
> qlen 1000
>
> link/ether 08:94:ef:82:4c:77 brd ff:ff:ff:ff:ff:ff
>
> inet 9.x.x.84/24 brd 9.x.x.255 scope global eth1. —> Public IP
>
> valid_lft forever preferred_lft forever
>
> inet6 fe80::a94:efff:fe82:4c77/64 scope link
>
> valid_lft forever preferred_lft forever
>
>
>
> *Routing table:*
>
> Kernel IP routing table
>
> Destination Gateway Genmask Flags MSS WindowirttIface
>
> 0.0.0.010.x.x.1 0.0.0.0 UG 0 0 0 eth0
>
> 0.0.0.0 9.x.x.10.0.0.0 UG00 0 eth1<<==== not pingable.
>
> 9.x.x.0 0.0.0.0 255.255.255.0 U00 0 eth1
>
> 10.x.x.0 0.0.0.0 255.255.255.0 U0 00 eth0
>
> 169.254.0.00.0.0.0 255.255.0.0U0 00 eth0
>
>
>
> But with DHCP enabled on eth1, dhcp subnet with metric value 1024 was 
> always at the bottom and was reachable
> as DHCP routesget priority over static routes.
>
>
Its good if Redfish has a way to set the metric value as an optional 
parameter while user PATCHes the Static IP address. This can be used by 
phosphor-networkd to set the route priority on that interface while 
adding route for this IP.

>
> Regards,
>
> Raviteja
>
>
> On Thu, Jun 23, 2022 at 12:34 PM Jiaqing Zhao 
> <jiaqing.zhao@linux.intel.com> wrote:
>
>     Hi, Raviteja
>
>     Can you help explain the routing issue you met?
>
>     I've also met a metric-related issue. When there are 2 interfaces,
>     one use DHCP,
>     the other use Static, systemd-networkd sets the metric 1024 on the
>     DHCP-assigned
>     default routev (metric for static default gateway is 0), which
>     causing peers
>     only reachable via the DHCP-assigned default route cannot be accessed.
>
>     And in current OpenBMC implementation, I think we should allow
>     setting null to
>     Gateway of IPv4StaticAddress to not set default route on that
>     interface.
>
>     Thanks,
>     Jiaqing
>
>     On 2022-06-22 18:50, raviteja bailapudi wrote:
>     > Hi Team
>     >
>     > We have hit network routing issues while using Static IPv4
>     addresses on
>     > both eth0 and eth1,  as both default gateways at the interfaces
>     were of the
>     > same metric value. To solve this problem we are planning to
>     provide an
>     > interface for admins to set the metric value for the gateway
>     while setting
>     > up the Static IPv4 network on BMC.
>     >
>     >
>     > To enable users to connect from outside-subnet clients, we also
>     need to
>     > support static routes on BMC.
>     >
>     >
>     > I have started a thread in redfish forum as well
>     >
>     >
>     https://redfishforum.com/thread/683/network-routing-table-management-support
>     >
>     >
>     > Please share your views on the same.
>     >
>     >
>     >
>     > Regards,
>     >
>     > Raviteja
>     >
>
--------------jzQobrMKY049MUBKeSgn0sjx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-06-2022 15:57, raviteja bailapudi
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi, Jiaqing
        <div><br>
        </div>
        <div>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">We have noticed an issue while using Static IPv4
            addresses on both eth0 and eth1.<br>
            We have configured a static private IP with the matching
            subnet of Laptop Connected on eth0 and<span
              class="gmail-Apple-converted-space">  </span>configured a
            static public IP on eth1.<br>
            Both routes have got the metric value 0. eth0 route is the
            first entry of the routing table which was being used for
            routing.<br>
          </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
          </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">Ping to eth1 IP &lt;9.x.x.84&gt; does not work
            and that Eth0 private IP pings from the laptop connected.<br>
            <br>
            <b>
              IP<span class="gmail-Apple-converted-space">  </span>Config:</b><br>
          </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
          </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt;
            mtu 1500 qdisc pfifo_fast qlen 1000</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>link/ether
            08:94:ef:82:4c:76 brd ff:ff:ff:ff:ff:ff</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>inet
            <a href="http://169.254.7.123/16" moz-do-not-send="true">169.254.7.123/16</a>
            brd 169.254.255.255 scope link eth0</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">      
            </span>valid_lft forever preferred_lft forever</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>inet
            10.x.x.100/24 brd 10.6.6.255 scope global eth0.<span
              class="gmail-Apple-converted-space">          </span>—&gt;
            Private IP (Connected to laptop)</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">      
            </span>valid_lft forever preferred_lft forever</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>inet6
            fe80::a94:efff:fe82:4c76/64 scope link</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">      
            </span>valid_lft forever preferred_lft forever</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">3: eth1: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt;
            mtu 1500 qdisc pfifo_fast qlen 1000</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>link/ether
            08:94:ef:82:4c:77 brd ff:ff:ff:ff:ff:ff</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>inet
            9.x.x.84/24 brd 9.x.x.255 scope global eth1. <span
              class="gmail-Apple-converted-space">              </span>—&gt;
            Public IP<span class="gmail-Apple-converted-space"> </span></p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">      
            </span>valid_lft forever preferred_lft forever</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">    </span>inet6
            fe80::a94:efff:fe82:4c77/64 scope link</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><span class="gmail-Apple-converted-space">      
            </span>valid_lft forever preferred_lft forever</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
            <br>
            <b>
              Routing table:</b><br>
            <br>
            Kernel IP routing table</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">Destination <span
              class="gmail-Apple-converted-space">    </span>Gateway <span
              class="gmail-Apple-converted-space">        </span>Genmask
            <span class="gmail-Apple-converted-space">        </span>Flags
            <span class="gmail-Apple-converted-space">  </span>MSS <span
              class="gmail-Apple-converted-space">  </span>Window<span
              class="gmail-Apple-converted-space">  </span>irtt<span
              class="gmail-Apple-converted-space">  </span>Iface</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">0.0.0.0<span class="gmail-Apple-converted-space"> 
                            </span>10.x.x.1 <span
              class="gmail-Apple-converted-space">            </span>0.0.0.0
            <span class="gmail-Apple-converted-space">          </span>UG
            <span class="gmail-Apple-converted-space">        </span>0
            <span class="gmail-Apple-converted-space">      </span>0 <span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">  </span>eth0</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">0.0.0.0 <span
              class="gmail-Apple-converted-space">                </span>9.x.x.1<span
              class="gmail-Apple-converted-space">              </span>0.0.0.0
            <span class="gmail-Apple-converted-space">          </span>UG<span
              class="gmail-Apple-converted-space">        </span>0<span
              class="gmail-Apple-converted-space">        </span>0 <span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">  </span>eth1<span
              class="gmail-Apple-converted-space">  </span>&lt;&lt;====
            not pingable.<span class="gmail-Apple-converted-space"> </span></p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">9.x.x.0 <span
              class="gmail-Apple-converted-space">                </span>0.0.0.0
            <span class="gmail-Apple-converted-space">        </span>255.255.255.0
            <span class="gmail-Apple-converted-space">  </span>U<span
              class="gmail-Apple-converted-space">          </span>0<span
              class="gmail-Apple-converted-space">        </span>0 <span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">  </span>eth1</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">10.x.x.0 <span
              class="gmail-Apple-converted-space">              </span>0.0.0.0
            <span class="gmail-Apple-converted-space">        </span>255.255.255.0
            <span class="gmail-Apple-converted-space">  </span>U<span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">        </span>0<span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">  </span>eth0</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">169.254.0.0<span
              class="gmail-Apple-converted-space">        </span>0.0.0.0
            <span class="gmail-Apple-converted-space">        </span>255.255.0.0<span
              class="gmail-Apple-converted-space">        </span>U<span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">        </span>0<span
              class="gmail-Apple-converted-space">          </span>0 <span
              class="gmail-Apple-converted-space">  </span>eth0</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
            <br>
            But with DHCP enabled on eth1, dhcp subnet with metric value
            1024 was always at the bottom and was reachable<br>
            as DHCP routes<span class="gmail-Apple-converted-space">  </span>get
            priority over static routes. </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
          </p>
        </div>
      </div>
    </blockquote>
    <p>Its good if Redfish has a way to set the metric value as an
      optional parameter while user PATCHes the Static IP address. This
      can be used by phosphor-networkd to set the route priority on that
      interface while adding route for this IP.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com">
      <div dir="ltr">
        <div>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;"><br>
          </p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">Regards,</p>
          <p
style="margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica
            Neue&quot;">Raviteja</p>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Jun 23, 2022 at 12:34
          PM Jiaqing Zhao &lt;<a
            href="mailto:jiaqing.zhao@linux.intel.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">jiaqing.zhao@linux.intel.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Hi,
          Raviteja<br>
          <br>
          Can you help explain the routing issue you met?<br>
          <br>
          I've also met a metric-related issue. When there are 2
          interfaces, one use DHCP,<br>
          the other use Static, systemd-networkd sets the metric 1024 on
          the DHCP-assigned<br>
          default routev (metric for static default gateway is 0), which
          causing peers<br>
          only reachable via the DHCP-assigned default route cannot be
          accessed.<br>
          <br>
          And in current OpenBMC implementation, I think we should allow
          setting null to<br>
          Gateway of IPv4StaticAddress to not set default route on that
          interface.<br>
          <br>
          Thanks,<br>
          Jiaqing<br>
          <br>
          On 2022-06-22 18:50, raviteja bailapudi wrote:<br>
          &gt; Hi Team<br>
          &gt; <br>
          &gt; We have hit network routing issues while using Static
          IPv4 addresses on<br>
          &gt; both eth0 and eth1,  as both default gateways at the
          interfaces were of the<br>
          &gt; same metric value. To solve this problem we are planning
          to provide an<br>
          &gt; interface for admins to set the metric value for the
          gateway while setting<br>
          &gt; up the Static IPv4 network on BMC.<br>
          &gt; <br>
          &gt; <br>
          &gt; To enable users to connect from outside-subnet clients,
          we also need to<br>
          &gt; support static routes on BMC.<br>
          &gt; <br>
          &gt; <br>
          &gt; I have started a thread in redfish forum as well<br>
          &gt; <br>
          &gt; <a
href="https://redfishforum.com/thread/683/network-routing-table-management-support"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://redfishforum.com/thread/683/network-routing-table-management-support</a><br>
          &gt; <br>
          &gt; <br>
          &gt; Please share your views on the same.<br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          &gt; Regards,<br>
          &gt; <br>
          &gt; Raviteja<br>
          &gt; <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------jzQobrMKY049MUBKeSgn0sjx--
