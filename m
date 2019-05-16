Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D620589
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 13:44:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454V2d3p0NzDqdb
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 21:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jCMS0Hjv"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Tyn5PPTzDqZl
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 21:41:21 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id w144so2214168oie.12
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RpF+pxbdQ11V/YhKVxUMjWFRsXXLYHDCI5wJ7wBmqrQ=;
 b=jCMS0Hjv9kbZbBAmfvAEAzwCCROVhfAy9hY6WKB3tLfFKh5QORc9gSjAKYcnZvbq4q
 VRX0IXRfRiuBn3QBlXnFLQogvMrIvn9pFj0h1x2Q6vEsiplLVmZelo+ttzqm09va4dxx
 zwaSIKyhJRJ8nNL5rLxGAc8Qa4/gNdrRWPfS7mGZOwUMGD7Xsu1J25/QILwJe6y+ggUQ
 sDw6r4B+t8YN2Vr/zp7JGojrQ0Ewv7O+CqJXoIHHzJIuc8+o98mpABG2hz7fBwnTLtqC
 x3rtI0bWzT0Dz7ciS9l5pwZfbOr2p0rq1AgU6BvvfmZSMKVCKWjc4p3Wcz07Q5IMnCL4
 UEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RpF+pxbdQ11V/YhKVxUMjWFRsXXLYHDCI5wJ7wBmqrQ=;
 b=JiTGT8ZQfS/sqIdaxXa8KNBeNTZKESTWFTu8sD6rMEmBTaulNlDJNYmBooj9il52Dt
 qWJwEKmm81l/ioin1spjak7Dl2Sww+emEZQmHWs+WSaycHX2fIYpUShhuv34iIGRV2kE
 VdCu5b6cXxx/2Vt3ZGHkRur3W6mG1Dcz3zV4HwOVoxcbLLe9uqE+ZQB9vBm7yvbh/QKF
 48g2ONpbjXGRqSCwu+uNRG5JYNrVEKYeMZPxXVC8FbE6ZwEcL3wXrtZTbkHqnxTU4SNT
 HxmovMSqFU1wfOnmKHGZAEayKVj0Hmuu5F+F9uDtcQARzgq91EncbqG3BqGlyComPrOG
 O+kA==
X-Gm-Message-State: APjAAAXq3J3JVRHsgI8ZL2Tnjx7G/yFfHWU6WAXaUwWlRnqkZN0WItkf
 rhYaKGgMtG1duv9TkJNLS1G53pRR+zn83HPnUghgz9j/TAk=
X-Google-Smtp-Source: APXvYqx/+vzLywE8x/ZWcDcvjbae8azgMrQN+Arb39pV50Wk7cC50CAvpLUNdrsCtiTiy6vtupu4ecnLb/igBYKnfx8=
X-Received: by 2002:aca:72c5:: with SMTP id p188mr9401329oic.116.1558006877847; 
 Thu, 16 May 2019 04:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
 <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
 <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
 <3e535745-9cc8-3289-61a7-8ad7a0bb9f9e@linux.vnet.ibm.com>
 <988b05f0-4d72-cf00-b717-82759a6eb8ac@linux.vnet.ibm.com>
 <1948c6f25ec94cb28fbb7927a42989f7@quantatw.com>
In-Reply-To: <1948c6f25ec94cb28fbb7927a42989f7@quantatw.com>
From: Troy Lee <leetroy@gmail.com>
Date: Thu, 16 May 2019 19:41:06 +0800
Message-ID: <CAN9Jwz2RjPwQ-0asohxTT8pCy1nbpwdzgB-e-ka4vx=by9c-7w@mail.gmail.com>
Subject: Re: Switching to static network address issues
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tony,

Your situation is a bit different.

You'll have 5 seconds window to send all these settings (
ipsrc/ipaddr/defgw ipaddr)  through IPMI at once.
Then the network-manager of OpenBMC will correctly apply you setting
into system.
For example:
  ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan set 2 ipsrc st=
atic
  ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan set 2
ipaddr 10.10.9.3
  ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan set 2
netmask 255.255.0.0
  ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan set 2
defgw ipaddr 10.10.10.204


Otherwise, it will show the follow error message in journal log, and
it seems not recoverable from in-band IPMI.
  May 16 19:03:59 romulus systemd[1]: Started Network Service.
  May 16 19:03:59 romulus systemd-networkd[1261]: sit0: Could not
acquire IPv4 link-local address: Invalid argument
  May 16 19:04:00 romulus systemd-networkd[1261]: eth0: Could not set
route: Network is unreachable
  May 16 19:04:02 romulus systemd[1]: Starting Hostname Service...
  May 16 19:03:54 romulus ipmid[1169]: Failed to set network data

Hope this helps.

However, we have similar name :)

Thanks,
Troy Lee

--
Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com> =E6=96=BC 20=
19=E5=B9=B45=E6=9C=8816=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:23=
=E5=AF=AB=E9=81=93=EF=BC=9A

>
> Hi there,
> I also met an similar issue about switching network address from DHCP to =
static.
> Here is my configuration steps:
>
> 1. ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan print 2
> Set in Progress         : Set Complete
> Auth Type Support       : MD5
> Auth Type Enable        : Callback : MD5
>                         : User     : MD5
>                         : Operator : MD5
>                         : Admin    : MD5
>                         : OEM      : MD5
> IP Address Source       : DHCP Address
> IP Address              : 10.10.15.206
> Subnet Mask             : 255.255.0.0
> MAC Address             : 00:00:f7:a0:7f:f2
> Default Gateway IP      : 10.10.10.204
> 802.1q VLAN ID          : Disabled
> RMCP+ Cipher Suites     : 3,17
> Cipher Suite Priv Max   : Not Available
> Bad Password Threshold  : Not Available
>
> 2. ipmitool -H 10.10.15.206 -U root -P 0penBmc -I lanplus lan set 2 ipsrc=
 static
>
> 3. root@gsj:~# cat /etc/systemd/network/00-bmc-eth1.network
> [Match]
> Name=3Deth1
> [Network]
> LinkLocalAddressing=3Dno
> IPv6AcceptRA=3Dfalse
> DHCP=3Dfalse
> Address=3Dfe80::200:f7ff:fea0:7ff2/64
> Gateway=3D10.10.10.204
> [DHCP]
> ClientIdentifier=3Dmac
> UseDNS=3Dtrue
> UseNTP=3Dtrue
> UseHostname=3Dtrue
> SendHostname=3Dtrue
>
> 4. Set static ip
> root@gsj:~# ipmitool lan set 2 ipaddr 10.10.9.3
> Setting LAN IP Address to 10.10.9.3
>
> 5. root@gsj:~# cat /etc/systemd/network/00-bmc-eth1.network
> [Match]
> Name=3Deth1
> [Network]
> LinkLocalAddressing=3Dno
> IPv6AcceptRA=3Dfalse
> DHCP=3Dfalse
> Address=3Dfe80::200:f7ff:fea0:7ff2/64
> Gateway=3D10.10.10.204
> [DHCP]
> ClientIdentifier=3Dmac
> UseDNS=3Dtrue
> UseNTP=3Dtrue
> UseHostname=3Dtrue
> SendHostname=3Dtrue
>
> But static IP doesn't work.
> Is my step wrong?
>
> > -----Original Message-----
> > From: openbmc
> > [mailto:openbmc-bounces+tony.lee=3Dquantatw.com@lists.ozlabs.org] On
> > Behalf Of Gunnar Mills
> > Sent: Thursday, April 11, 2019 5:14 AM
> > To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>; openbmc@lists.ozlabs.org
> > Subject: Re: Switching to static network address issues
> >
> > On 4/10/2019 7:55 AM, Ratan Gupta wrote:
> >
> > >
> > > Can you take a look at what are the rest url which is being executed
> > > underneath?
> > >
> > When the DHCP setting changes on the GUI (e.g. "OBTAIN AN IP ADDRESS
> > AUTOMATICALLY USING DHCP" to "ASSIGN A STATIC IP ADDRESS"), the
> > /xyz/openbmc_project/network/<interface>/attr/DHCPEnabled interface is
> > called on "Save settings".
> >
> > https://github.com/openbmc/phosphor-webui/blob/2f481e4cb83f0c72a9f3aa
> > d11431e4abcf5d632c/app/common/services/api-utils.js#L428
> >
> > Hope this helps.
> >
> > >
> > > On 10/04/19 3:39 PM, Troy Lee wrote:
> > >> Hi William,
> > >>
> > >> This issue could be reproduce with WebUI or REST interface.
> > >> 1. Starts up romulus-bmc qemu as normal, so the IP address is
> > >> acquired from DHCP by default, let's say "10.1.1.2".
> > >> 2. Open the browser and login to https://10.1.1.2/, 3. Switch to
> > >> [Server Configuration] tab.
> > >>      Then you will see the current setting is "OBTAIN AN IP ADDRESS
> > >> AUTOMATICALLY USING DHCP".
> > >> 4. Click on checkbox "ASSIGN A STATIC IP ADDRESS, and DO NOT CHANGE
> > >> the IP address, leave it the same as DHCP IP address "10.1.1.2".
> > >> 5. Click on "Save settings" button.
> > >>
>
