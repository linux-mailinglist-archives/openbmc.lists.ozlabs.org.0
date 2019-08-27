Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928E9EC27
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 17:15:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hsrn2S6wzDqnw
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 01:15:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="GsWhSCuV"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hsqr5RfRzDqm9
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 01:15:04 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2F0EE42EED
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1566918898; x=
 1568733299; bh=64H5X3M5rsNra2l7itvX3KbkG9F9kYCteHim/YvA+uM=; b=G
 sWhSCuVR6Tilt3lmIJr5TrAGIkZcj98+VFXgZvyp+i/lICheueXKlDWXiNqYJvRO
 0SKqY7IZQquUI6hjgu/AVaIjGDd44oiS86+m+LGt9LkI34Lk0/RJHG9WS/YEnPEd
 rBm6cx0t7lFa31H2d59Gdxi52rirjC24Of2knftdtk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jjy6Ce80UEfN for <openbmc@lists.ozlabs.org>;
 Tue, 27 Aug 2019 18:14:58 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5345441209
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 18:14:58 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 27
 Aug 2019 18:14:57 +0300
Subject: Re: custom ntp server in phosphor-networkd
To: <openbmc@lists.ozlabs.org>
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
 <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <21bd95b7-a6e1-d7e4-d232-cf1a20f71a33@yadro.com>
Date: Tue, 27 Aug 2019 18:14:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XaVEQNegHYvnL3AtWw4G6CwtVbgm6U3Oz"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--XaVEQNegHYvnL3AtWw4G6CwtVbgm6U3Oz
Content-Type: multipart/mixed; boundary="AI6fjs0haY6oZMvZHCpZcdJk8aUHuQWUQ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <21bd95b7-a6e1-d7e4-d232-cf1a20f71a33@yadro.com>
Subject: Re: custom ntp server in phosphor-networkd
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
 <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
In-Reply-To: <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>

--AI6fjs0haY6oZMvZHCpZcdJk8aUHuQWUQ
Content-Type: multipart/alternative;
 boundary="------------8DFA98B67FBFB4158DE989D8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8DFA98B67FBFB4158DE989D8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

27.08.2019 13:32, Ratan Gupta wrote:
> On 27/08/19 1:13 PM, Alexander A. Filippov wrote:
>> On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
>>> This is pretty common behavior for DHCP settings.
>> On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
>>> Why this is wrong,
>> Ok, ok.  I wasn't clear enough. My appologies.
>>
>> I've meant that the impossibility to add a custom ntp server while dhc=
p is
>> enabled is wrong. Of course, the list of ntp servers received from DHC=
P-server
>> must be used. And I propose to move only manual settings.
>>
>> I believe that it is a same stuff with DNS-servers, routes. But probab=
ly, the
>> BMC is not such kind of devices which is required such deep settings. =
One of the
>> possible reasons was specified by Vernon quoted below:
>>
>> On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
>>> It seems to me that if you are using static settings for your network=
,=20
>>> then you would also have static (or user-supplied) settings for NTP a=
nd=20
>>> DNS. But if you are using DHCP for the network, it would make sense t=
o=20
>>> use the NTP and DNS settings supplied by the DHCP server.
>>>
>>> Now it might also be nice to have some reasonable defaults for NTP=20
>>> servers. It is not uncommon to have IP gateways also be NTP servers, =
so=20
>>> it might be reasonable to attempt to use the gateway as an NTP server=
 if=20
>>> none was specified in the DHCP response. I don't like the idea of=20
>>> setting the default NTP server to be something that is globally=20
>>> addressable because that makes the assumption that the BMC can reach =

>>> global networks, which should not be the case.
> I have the following suggestion
>
>
> =3D> By default all the DHCP optional parameters will be set to false(i=
=2Ee Don't
> ask the optional info from the DHCP server) =3D> If users wants the DHC=
P
> provided configuration then it has to set the specific optional paramet=
ers to
> true(Say NTPEnabled=3Dtrue).

I'd say that sysadmins won't be happy with this approach. If I were them =
I'd
prefer this:

1. If DHCP is globally enabled for the BMC and the DHCP server sends any
parameters, then they take precedence
2. If any of the optional parameters are not provided by DHCP server or D=
HCP is
globally disabled for the BMC, then statically defined settings are used

IMO, that is a very simple and deterministic approach without any
easy-to-overlook settings.

> =3D> User configures the Static NTP =3D> Check if DHCP is enabled then =
look for
> the DHCP configuration parameters, if "NTP Enabled is true"
> then user wants the NTP server from the DHCP and in that case don't all=
ow the
> static configuration.
> =3D> if DHCP is enabled but in DHCP configuration parameters "NTP Enabl=
ed is false"
> then user doesn't want the NTP server from the DHCP and allow the stati=
c
> configuration.
>
> Link:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Network/DHCPConfiguration.interface.yaml
>
> Note: It may happen that user has set DHCP Configuration parameters on =
the BMC
> to take the NTP server details from the
> DHCP server but have not configured the DHCP server to provide the NTP =
server,
> in that case
> Static NTP server configuration will not be allowed.

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com


--------------8DFA98B67FBFB4158DE989D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    27.08.2019 13:32, Ratan Gupta wrote:<br>
    <blockquote type=3D"cite"
      cite=3D"mid:93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com=
">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div class=3D"moz-cite-prefix">On 27/08/19 1:13 PM, Alexander A.
        Filippov wrote:<br>
      </div>
      <blockquote type=3D"cite"
        cite=3D"mid:20190827074336.GA14200@bbwork.lan">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, Aug 26, 2019 at 10=
:23:15AM -0700, Vernon Mauery wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">This is pretty common be=
havior for DHCP settings.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Aug 27, 2019 at 11=
:28:36AM +0530, Ratan Gupta wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Why this is wrong,
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Ok, ok.  I wasn't clear en=
ough. My appologies.

I've meant that the impossibility to add a custom ntp server while dhcp i=
s
enabled is wrong. Of course, the list of ntp servers received from DHCP-s=
erver
must be used. And I propose to move only manual settings.

I believe that it is a same stuff with DNS-servers, routes. But probably,=
 the
BMC is not such kind of devices which is required such deep settings. One=
 of the
possible reasons was specified by Vernon quoted below:

On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">It seems to me that if y=
ou are using static settings for your network,=20
then you would also have static (or user-supplied) settings for NTP and=20
DNS. But if you are using DHCP for the network, it would make sense to=20
use the NTP and DNS settings supplied by the DHCP server.

Now it might also be nice to have some reasonable defaults for NTP=20
servers. It is not uncommon to have IP gateways also be NTP servers, so=20
it might be reasonable to attempt to use the gateway as an NTP server if =

none was specified in the DHCP response. I don't like the idea of=20
setting the default NTP server to be something that is globally=20
addressable because that makes the assumption that the BMC can reach=20
global networks, which should not be the case.
</pre>
        </blockquote>
      </blockquote>
      <tt>I have the following suggestion</tt><tt><br>
      </tt><tt><br>
      </tt><tt><br>
      </tt><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); te=
xt-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;">=3D&gt; By default all the DHCP optional p=
arameters will be set to false(i.e Don't ask the optional info from the D=
HCP server)
=3D&gt; If users wants the DHCP provided configuration then it has to set=
 the specific optional parameters to true(Say NTPEnabled=3Dtrue).</span><=
/tt></blockquote>
    <p>I'd say that sysadmins won't be happy with this approach. If I
      were them I'd prefer this:<br>
    </p>
    <p>1. If DHCP is globally enabled for the BMC and the DHCP server
      sends any parameters, then they take precedence<br>
      2. If any of the optional parameters are not provided by DHCP
      server or DHCP is globally disabled for the BMC, then statically
      defined settings are used</p>
    <p>IMO, that is a very simple and deterministic approach without any
      easy-to-overlook settings.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com=
"><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;">
=3D&gt; User configures the Static NTP
=3D&gt; Check if DHCP is enabled then look for the DHCP configuration par=
ameters, if "NTP Enabled is true"</span></tt><tt><br>
      </tt><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); te=
xt-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;">then user wants the NTP server from the DH=
CP and in that case don't allow the static configuration.</span></tt><tt>=
<br>
      </tt><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); te=
xt-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;">=3D&gt; if DHCP is enabled but in DHCP con=
figuration parameters "</span></tt><tt><span style=3D"color: rgb(33, 33, =
33); font-size: 13px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: pre-=
wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color=
: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-col=
or: initial; display: inline !important; float: none;"><span style=3D"col=
or: rgb(33, 33, 33); font-size: 13px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
background-color: rgb(255, 255, 255); text-decoration-style: initial; tex=
t-decoration-color: initial; display: inline !important; float: none;">NT=
P Enabled is false</span>"</span></tt><tt><br>
      </tt><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); te=
xt-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;">then user doesn't want the NTP server from=
 the DHCP and allow the static configuration.</span></tt><tt><br>
      </tt><tt><br>
      </tt><tt>Link: </tt><tt><a href=3D"https://github.com/openbmc/phosp=
hor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/DHCPConfigura=
tion.interface.yaml" target=3D"_blank" rel=3D"noopener" class=3D"style-sc=
ope gr-linked-text" style=3D"box-sizing: border-box; margin: 0px; padding=
: 0px; border: 0px none; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-variant-numeric: inherit; font-varian=
t-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size=
: 13px; line-height: inherit; vertical-align: baseline; color: rgb(42, 10=
2, 217); letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; background-color: rgb(255, 255, 255);" moz-do-not-sen=
d=3D"true">https://github.com/openbmc/phosphor-dbus-interfaces/blob/maste=
r/xyz/openbmc_project/Network/DHCPConfiguration.interface.yaml</a></tt><t=
t><br>
      </tt><tt><span style=3D"color: rgb(33, 33, 33); font-size: 13px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); te=
xt-decoration-style: initial; text-decoration-color: initial; display: in=
line !important; float: none;"></span></tt><tt><br>
      </tt><tt>Note: It may happen that user has set DHCP Configuration
        parameters on the BMC to take the NTP server details from the</tt=
><tt><br>
      </tt><tt>DHCP server but have not configured the DHCP server to
        provide the NTP server, in that case</tt><tt><br>
      </tt><tt>Static NTP server configuration will not be allowed.</tt><=
/blockquote>
    <pre class=3D"moz-signature" cols=3D"80">With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
<a class=3D"moz-txt-link-freetext" href=3D"https://yadro.com">https://yad=
ro.com</a></pre>
  </body>
</html>

--------------8DFA98B67FBFB4158DE989D8--

--AI6fjs0haY6oZMvZHCpZcdJk8aUHuQWUQ--

--XaVEQNegHYvnL3AtWw4G6CwtVbgm6U3Oz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdZUjxAAoJEOiTWHtbdBeNuwUP/3DAu1vXNvdpGCpWhFMYAQ/D
S2oXOGHwvM3G44jDR6f/ABacumvilRjJr8RTJvPWFkX0NB5pYSNjHTvlyvJx4k38
0aI8GKYdIZyPl4DcBaMPPADyoV4v+nZkeCsY1dCkMLgfwGPjesplcEhzdjMzrmGZ
Q5ry7Eo3ukaSKJTRKmTg2qb9mn+TZR/DQnD7fqCSfeDR26pkZs+eifbftD42+gvc
U3sVGUyIYwS96SDqS6jovAM0O0W6FCFbm/F4zped0ZzTEe8CzKkrTLepi/mmaJxg
4dd+bdNx6+0Qg35GIYeV7V6DccwCSAG2gC7bpO0F2aEPqdRQWJ7BLBcDOeDFtRjt
3bcar5EEHLjLy4+ZwwkGYuqxS2HEZ6siA6HhlTL+4oDMoxPIpjceuF/SNi6njuL5
luszqtX+LDGBm/iWgBcxuEcbhFot44jtKUsNrPPXxBdo73bfY2q1J/CKvsQPkW+E
cRWdx8OgHxr0eVuAYvsjzhypwuZRfsxdFHnw3WPGnq4Rm3tmzlUIAeRd5Bkej8by
DUxbarEfutZO2CUYb2CYT9LTgHc2UZbwbJRB8H/cOx7OGPOWzu18JMPFzk23nuEA
s8ktqkgrk7g+WeXmGZiE2/MpDvDRKAEHk70yJzlunbiDxLctfKhyyrK8T31mzKUs
+kreR4D+fP/3Z47/KbRk
=lv+w
-----END PGP SIGNATURE-----

--XaVEQNegHYvnL3AtWw4G6CwtVbgm6U3Oz--
