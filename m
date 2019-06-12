Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C143045
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 21:34:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PH9W3ms0zDr3X
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 05:33:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2b; helo=mail-yw1-xc2b.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pdadCSA1"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PH6v1sMYzDr2q
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 05:31:34 +1000 (AEST)
Received: by mail-yw1-xc2b.google.com with SMTP id b143so7293841ywb.7
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1bcbSuS9sEN7ps7RQ/5EzL/nP+jPSAKbZiwglpWcJ2E=;
 b=pdadCSA1CyXRg+6tZCa55KOXfYC8iAFT2CYqJyox+G+C9WsenAFfEHaJXOruvggG8a
 bBcOprKoaVZKsm2gs6HIUvwbmuIRPAYJaCSBl1NSAoADgUT//+IY4JtQI07jbllPhixc
 EZfiuRCDuhaPbhCWqmyxt4rzaBEIUeUpGVl4ei5ZT+08T2oiUhbRs5qRoCB5ZV3PaplE
 R3dmYlW9Q6RZYpAAyQj6uiDDupksadqLq5PugZ9eb0KJA6wA0HEL4VAJtjFhk2xE6BjF
 GsrUqiG+QhCWs0dGnwj1ZxUV2aSVZZND9hrkq36sup02ijnF+StcVD+nz8NW6jmeXqth
 msxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1bcbSuS9sEN7ps7RQ/5EzL/nP+jPSAKbZiwglpWcJ2E=;
 b=bOynYbNglFVj6kcZvyzMyIQTjvCTLbp3VfHc5j691oLDVKLM+TfnqtSRsSiSUptBn4
 oApCBDNtwrYzi/wdYn4Ac2PSHBtZx7fPvmIkDylYMCYjIIxPsHwlHeXYijORL2ofwGD7
 z+75sSyL+gZlqc71Vnok2aBZnNaLhBsCslFZRj5i89R/I3CgvDILtqSHoB2D9n9G2/P4
 zzpO42dcR/ii9bSOHuCgf75+DoydCv4yq3Qg3Dh86Ikz41yrrgrwoSZCBPRTzFZrGODW
 u4tnfZ4vzM87MPZI7t4n+5+MHD2DzIEnoZ73ZDZOu83nT7h11L+aZnqq++1Rd7Cap/gm
 lcAg==
X-Gm-Message-State: APjAAAVD2g7IgGVJuWIk93jF4ewTIN96NuwQIfeHPs+B1TFez+w4ITa0
 gPhnwB4bvFYRECdIaTy0SZKDCdYydQvZ+nAEcGQ=
X-Google-Smtp-Source: APXvYqzMaV51xuFbDFvhQU8y2oPs+HQu7Mc8XzaLPx7Uf1O+Zd1ncwsYoudzF87gsCMbychvxnnGLEdw1+M4KTDxMQM=
X-Received: by 2002:a81:7a52:: with SMTP id v79mr28623996ywc.41.1560367890400; 
 Wed, 12 Jun 2019 12:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMTupoQuV9AVpqvVu5E1M_vk3FkcQbvsdKR_ngUJFUai_MiFcA@mail.gmail.com>
 <0dde6e4b-484c-6d44-7e36-92551dbdd460@linux.vnet.ibm.com>
In-Reply-To: <0dde6e4b-484c-6d44-7e36-92551dbdd460@linux.vnet.ibm.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 12 Jun 2019 14:31:19 -0500
Message-ID: <CAMTupoTQ=xDx9jpPQ+MhsBpKT_sg2vPcmTne7josv7FbmStA+Q@mail.gmail.com>
Subject: Re: Network Settings GUI
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000d38a51058b2575a1"
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

--000000000000d38a51058b2575a1
Content-Type: text/plain; charset="UTF-8"

Hello Ratan,

Are you proposing that filter to be done at gui side? Suppose at first
> boot, By default DHCP and  Zero config is enabled, In that case back end
> will get two IP address (DHCP/ZeroConfig) and suppose after that user has
> not disabled the Zeroconfig than GUI will keep getting the two ipaddresses,
> in that case does the GUI apply the filter to show single IP address.

No filter on GUI side - In the case you are describing where by default
DHCP and zeroconfig are enabled and the user has not disabled the zero
config, the GUI will still show both. At any time, an interface will have
MAXIMUM two IP addresses, but one of those two must be from zero config.
The GUI should always reflect what is in the backend, it will not be a good
experience if we hide information from users.


Are we planning to propose new settings for GUI for IPv6.
> In IpV6 we may have multiple IPaddresses on the same interface
> (LinkLocal,autoconf,static)

As of now, all customers we have spoken with have said they do not
currently use IPV6 and have no plans to do so in the future, so this was
put on hold. If/when we choose to support IPV6, the design will be updated
to reflect it. Likely, it will be a very similar design with the addition
of an IPV6 section containing its own DNS servers and IP addresses.


What about the existing client network deployment where management traffic
> has been separated from the host traffic through VLAN?
> We got this request from one of our IBM Internal team(HPC)

I would love to know more about this as it is the first time I hear where
the requirement came from. Once we understand the use case for it and the
user needs, we can discuss prioritizing it for the GUI.


Regards,

Jandra A



On Tue, Jun 11, 2019 at 10:10 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi Jandra,
>
> Please find my comments inline in green.
>
> Regards
>
> Ratan Gupta
> On 10/06/19 8:53 PM, Jandra A wrote:
>
> Hello all,
>
> Here is the proposal for the Network Settings GUI:
> https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical
> To navigate, click on any flashing blue rectangles or use the right and
> left keyboard arrows.
>
> The design is based on the needs found by our research with stakeholders
> and users.
>
> With the GUI, a user is able to assign a Fully Qualified Domain Name
> (FQDN), and choose either DHCP or static configuration, for any selected
> interface.
>
> If DHCP is chosen, the GUI will reflect the appropriate default gateway,
> DNS server, and IP address assigned by the DHCP server. If static is
> selected, users manually assign the default gateway, as well as multiple
> DNS servers and a single IP address (not including the one assigned by
> zeroconf).
>
> Despite the type of configuration selected (DHCP or static),
> zero-configuration is always on to protect the user and ensure there is
> always an IP address assigned. However, once an interface has a non
> zeroconf IP address assigned, users have the flexibility to permanently
> delete that address. Currently, users can only temporarily delete these
> using CLI; once they reboot, the addresses come back. Permanently removing
> IP addresses assigned by zero-configuration is important to customers who
> need to account for every single IP address.
>
> Are you proposing that filter to be done at gui side? Suppose at first
> boot, By default DHCP and  Zero config is enabled, In that case back end
> will get two IP address
>
> (DHCP/ZeroConfig) and suppose after that user has not disabled the
> Zeroconfig than GUI will keep getting the two ipaddresses, in that case
> does the GUI apply the filter
>
> to show single IP address.
>
> Are we planning to propose new settings for GUI for IPv6
>
> In IpV6 we may have multiple IPaddresses on the same interface
> (LinkLocal,autoconf,static)
>
>
>
> NOTE: The reason for limiting to a single IP address per interface is that
> our research from users and stakeholders indicates that multiple would
> never be used and in fact it could make it easy to make a mistake, so for
> this reason we will not support it in the GUI. Additionally, there will be
> no support for VLAN as it was not expected by users and added unnecessary
> confusion.
>
> What about the existing client network deployment where management traffic
> has been separated from the host traffic through VLAN?
>
> We got this request from one of our IBM Internal team(HPC).
>
>
> Regards,
> Jandra Aranguren
>
>
>

--000000000000d38a51058b2575a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello=C2=A0Ratan,=C2=A0</div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Are you proposing that filter to be done at gui side? Suppose at fir=
st boot, By default DHCP and=C2=A0 Zero config is enabled, In that case bac=
k end will get two IP address (DHCP/ZeroConfig) and suppose after that user=
 has not disabled the Zeroconfig than GUI will keep getting the two ipaddre=
sses, in that case does the GUI apply the filter to show single IP address.=
</blockquote></div><div dir=3D"ltr"><p>No filter on GUI side - In the case =
you are describing where by default DHCP and zeroconfig are enabled and the=
 user has not disabled the zero config, the GUI will still show both. At an=
y time, an interface will have MAXIMUM two IP addresses, but one of those t=
wo must be from zero config. The GUI should always reflect what is in the b=
ackend, it will not be a good experience if we hide information from users.=
</p><p><br></p><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Are we pla=
nning to propose new settings for GUI for IPv6.<br>In IpV6 we may have mult=
iple IPaddresses on the same interface (LinkLocal,autoconf,static)</blockqu=
ote><p>As of now, all customers we have spoken with have said they do not c=
urrently use IPV6 and have no plans to do so in the future, so this was put=
 on hold. If/when we choose to support IPV6, the design will be updated to =
reflect it. Likely, it will be a very similar design with the addition of a=
n IPV6 section containing its own DNS servers and IP addresses.=C2=A0</p><p=
><br></p><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">What about the e=
xisting client network deployment where management traffic has been separat=
ed from the host traffic through VLAN?<br>We got this request from one of o=
ur IBM Internal team(HPC)</blockquote><p>I would love to know more about th=
is as it is the first time I hear where the requirement came from. Once we =
understand the use case for it and the user needs, we can discuss prioritiz=
ing it for the GUI.=C2=A0</p><p><br></p><p>Regards,</p><p>Jandra A</p></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 10=
:10 PM Ratan Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com">ratag=
upt@linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hi Jandra,</p>
    <p>Please find my comments inline in<font color=3D"#33cc00"> green</fon=
t>.</p>
    <p>Regards</p>
    <p>Ratan Gupta<br>
    </p>
    <div class=3D"gmail-m_4581134513326033599moz-cite-prefix">On 10/06/19 8=
:53 PM, Jandra A wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hello all,<br>
        <div><br>
        </div>
        <div>Here is the proposal for the Network Settings GUI:=C2=A0<a hre=
f=3D"https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Physical" tar=
get=3D"_blank">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319115961_Phy=
sical</a>=C2=A0<br>
          To navigate, click on any flashing blue rectangles or use the
          right and left keyboard arrows.</div>
        <div><br>
        </div>
        <div>The design is based on the needs found by our research with
          stakeholders and users.=C2=A0</div>
        <div><br>
        </div>
        <div>With the GUI, a user is able to assign a Fully Qualified
          Domain Name (FQDN), and choose either DHCP or static
          configuration, for any selected interface.</div>
        <div><br>
        </div>
        <div>If DHCP is chosen, the GUI will reflect the appropriate
          default gateway, DNS server, and IP address assigned by the
          DHCP server. If static is selected, users manually assign the
          default gateway, as well as multiple DNS servers and a single
          IP address (not including the one assigned by zeroconf).=C2=A0</d=
iv>
        <div><br>
        </div>
        <div>Despite the type of configuration selected (DHCP or
          static), zero-configuration is always on to protect the user
          and ensure there is always an IP address assigned. However,
          once an interface has a non zeroconf IP address assigned,
          users have the flexibility to permanently delete that address.
          Currently, users can only temporarily delete these using CLI;
          once they reboot, the addresses come back. Permanently
          removing IP addresses assigned by zero-configuration is
          important to customers who need to account for every single IP
          address. <br>
        </div>
      </div>
    </blockquote>
    <p>Are you proposing that filter to be done at gui side? Suppose at
      first boot, By default DHCP and=C2=A0 Zero config is enabled, In that
      case back end will get two IP address <br>
    </p>
    <p>(DHCP/ZeroConfig) and suppose after that user has not disabled
      the Zeroconfig than GUI will keep getting the two ipaddresses, in
      that case does the GUI apply the filter <br>
    </p>
    <p>to show single IP address.<br>
    </p>
    <p>Are we planning to propose new settings for GUI for IPv6</p>
    <p>In IpV6 we may have multiple IPaddresses on the same interface
      (LinkLocal,autoconf,static)<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div><br>
        </div>
        <div>NOTE: The reason for limiting to a single IP address per
          interface is that our research from users and stakeholders
          indicates that multiple would never be used and in fact it
          could make it easy to make a mistake, so for this reason we
          will not support it in the GUI. Additionally, there will be no
          support for VLAN as it was not expected by users and added
          unnecessary confusion. <br>
        </div>
      </div>
    </blockquote>
    <p>What about the existing client network deployment where
      management traffic has been separated from the host traffic
      through VLAN?</p>
    <p>We got this request from one of our IBM Internal team(HPC).<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Jandra Aranguren</div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000d38a51058b2575a1--
