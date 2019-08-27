Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D92BB9EBA5
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 16:55:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HsPW0ZF2zDqjj
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 00:55:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HsKk5Xp9zDqSP
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 00:52:21 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:52:16 -0700
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; 
 d="asc'?scan'208,217";a="192256048"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.79])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 27 Aug 2019 07:52:16 -0700
Subject: Re: custom ntp server in phosphor-networkd
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
 <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 mQENBFija08BCAC60TO2X22b0tJ2Gy2iQLWx20mGcD7ugBpm1o2IW2M+um3GR0BG/bUcLciw
 dEnX9SWT30jx8TimenyUYeDS1CKML/e4JnCAUhSktNZRPBjzla991OkpqtFJEHj/pHrXTsz0
 ODhmnSaZ49TsY+5BqtRMexICYOtSP8+xuftPN7g2pQNFi7xYlQkutP8WKIY3TacW/6MPiYek
 pqVaaF0cXynCMDvbK0km7m0S4X01RZFKXUwlbuMireNk4IyZ/59hN+fh1MYMQ6RXOgmHqxSu
 04GjkbBLf2Sddplb6KzPMRWPJ5uNdvlkAfyT4P0R5EfkV5wCRdoJ1lNC9WI1bqHkbt07ABEB
 AAG0JUpvaG5hdGhhbiBNYW50ZXkgPG1hbnRleWpnQGdtYWlsLmNvbT6JATcEEwEIACEFAlij
 a08CGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQ0EfviT3fHwmcBAgAkENzQ8s0RK+f
 nr4UogrCBS132lDdtlOypm1WgGDOVQNra7A1rvXFgN05RqrdRTpRevv7+S8ipbiG/kxn9P8+
 VhhW1SvUT8Tvkb9YYHos6za3v0YblibFNbYRgQcybYMeKz2/DcVU+ioKZ1SxNJsFXx6wH71I
 V2YumQRHAsh4Je6CmsiMVP4XNadzCQXzzcU9sstKV0A194JM/d8hjXfwMHZE6qnKgAkHIV3Q
 61YCuvkdr5SJSrOVo2IMN0pVxhhW7lqCAGBGb4oOhqePwGqOabU3Ui4qTbHP2BWP5UscehkK
 6TVKcpYApsUcWyxvvOARoktmlPnGYqJPnRwXpQBlqLkBDQRYo2tPAQgAyOv5Lgg2VkHO84R7
 LJJDBxcaCDjyAvHBynznEEk11JHrPuonEWi6pqgB8+Kc588/GerXZqJ9AMkR43UW/5cPlyF2
 wVO4aYaQwryDtiXEu+5rpbQfAvBpKTbrBfYIPc8thuAC2kdB4IO24T6PVSYVXYc/giOL0Iwb
 /WZfMd5ajtKfa727xfbKCEHlzakqmUl0SyrARdrSynhX1R9Wnf2BwtUV7mxFxtMukak0zdTf
 2IXZXDltZC224vWqkXiI7Gt/FDc2y6gcsYY/4a2+vjhWuZk3lEzP0pbXQqOseDM1zZXln/m7
 BFbJ6VUn1zWcrt0c82GTMqkeGUheUhDiYLQ7xwARAQABiQEfBBgBCAAJBQJYo2tPAhsMAAoJ
 ENBH74k93x8JKEUH/3UPZryjmM0F3h8I0ZWuruxAxiqvksLOOtarU6RikIAHhwjvluEcTH4E
 JsDjqtRUvBMU907XNotpqpW2e9jN8tFRyR4wW9CYkilB02qgrDm9DXVGb2BDtC/MY+6KUgsG
 k5Ftr9uaXNd0K4IGRJSyU6ZZn0inTcXlqD+NgOE2eX9qpeKEhDufgF7fKHbKDkS4hj6Z09dT
 Y8eW9d6d2Yf/RzTBJvZxjBFbIgeUGeykbSKztp2OBe6mecpVPhKooTq+X/mJehpRA6mAhuQZ
 28lvie7hbRFjqR3JB7inAKL4eT1/9bT/MqcPh43PXTAzB6/Iclg5B7GGgEFe27VL0hyqiqc=
Message-ID: <c1fb7fc5-3dc1-0937-476c-acb8b6f3cb84@intel.com>
Date: Tue, 27 Aug 2019 07:52:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ccmOgVpHzFycuB4lksp0rBhSsKN24q8c1"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ccmOgVpHzFycuB4lksp0rBhSsKN24q8c1
Content-Type: multipart/mixed; boundary="6xwRO8wvNs7OZftfMwODu5FPWxmRBkUwH";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Message-ID: <c1fb7fc5-3dc1-0937-476c-acb8b6f3cb84@intel.com>
Subject: Re: custom ntp server in phosphor-networkd
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
 <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
In-Reply-To: <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>

--6xwRO8wvNs7OZftfMwODu5FPWxmRBkUwH
Content-Type: multipart/alternative;
 boundary="------------58BB0A8E62950E634817DA1E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------58BB0A8E62950E634817DA1E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ratan, Alexander,

I've pushed code to improve DHCP recently which may be of value in this
instance.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/2=
4665
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/24666
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/24725

This implements a greater set of control over the DHCP from Redfish.=C2=A0=
 I
believe I tested using DHCP, while UseNTPServers =3D false was active.=C2=
=A0 I
then explicitly defined a static NTP server from one of the Intel
chimers.=C2=A0 I was able to get my clock updated from the assigned NTP
server.=C2=A0 Prior to this change NTP requests to the google chimers wen=
t
unanswered, as our BMC network can't get to the internet.

On 8/27/19 3:32 AM, Ratan Gupta wrote:
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
> =3D> By default all the DHCP optional parameters will be set to
> false(i.e Don't ask the optional info from the DHCP server) =3D> If
> users wants the DHCP provided configuration then it has to set the
> specific optional parameters to true(Say NTPEnabled=3Dtrue). =3D> User
> configures the Static NTP =3D> Check if DHCP is enabled then look for
> the DHCP configuration parameters, if "NTP Enabled is true"
> then user wants the NTP server from the DHCP and in that case don't
> allow the static configuration.
> =3D> if DHCP is enabled but in DHCP configuration parameters "NTP
> Enabled is false"
> then user doesn't want the NTP server from the DHCP and allow the
> static configuration.
>
> Link:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Network/DHCPConfiguration.interface.yaml
>
> Note: It may happen that user has set DHCP Configuration parameters on
> the BMC to take the NTP server details from the
> DHCP server but have not configured the DHCP server to provide the NTP
> server, in that case
> Static NTP server configuration will not be allowed.
>> On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
>>>  * The NTP servers defined in|/etc/systemd/timesyncd.conf|will be
>>>    appended to the per-interface list at runtime and the daemon will
>>>    contact the servers in turn until one is found that responds.
>> So, my propose is to implement this point.
>>
>> Regards,
>> Alexander
>>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------58BB0A8E62950E634817DA1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Ratan, Alexander,<br>
    <br>
    I've pushed code to improve DHCP recently which may be of value in
    this instance.<br>
    <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project=
=2Exyz/c/openbmc/phosphor-dbus-interfaces/+/24665">https://gerrit.openbmc=
-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/24665</a><br>
<a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-project=
=2Exyz/c/openbmc/phosphor-networkd/+/24666">https://gerrit.openbmc-projec=
t.xyz/c/openbmc/phosphor-networkd/+/24666</a><br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/bmcweb/+/24725">https://gerrit.openbmc-project.xyz/c/o=
penbmc/bmcweb/+/24725</a><br>
    <br>
    This implements a greater set of control over the DHCP from
    Redfish.=C2=A0 I believe I tested using DHCP, while UseNTPServers =3D=
 false
    was active.=C2=A0 I then explicitly defined a static NTP server from =
one
    of the Intel chimers.=C2=A0 I was able to get my clock updated from t=
he
    assigned NTP server.=C2=A0 Prior to this change NTP requests to the
    google chimers went unanswered, as our BMC network can't get to the
    internet.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 8/27/19 3:32 AM, Ratan Gupta wrote:=
<br>
    </div>
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
 the specific optional parameters to true(Say NTPEnabled=3Dtrue).
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
      </tt><tt>Static NTP server configuration will not be allowed.</tt>
      <blockquote type=3D"cite"
        cite=3D"mid:20190827074336.GA14200@bbwork.lan">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Aug 27, 2019 at 11=
:28:36AM +0530, Ratan Gupta wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D""> * The NTP servers defin=
ed in|/etc/systemd/timesyncd.conf|will be
   appended to the per-interface list at runtime and the daemon will
   contact the servers in turn until one is found that responds.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">So, my propose is to imple=
ment this point.

Regards,
Alexander

</pre>
      </blockquote>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------58BB0A8E62950E634817DA1E--

--6xwRO8wvNs7OZftfMwODu5FPWxmRBkUwH--

--ccmOgVpHzFycuB4lksp0rBhSsKN24q8c1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl1lQ5wACgkQ0EfviT3f
Hwnjlgf+K+YhLs1NM0qNPmMRToJe1bcQynel0+7ENzU0fR4Q5Os+naH5iYT4UWIb
OOoDDqLj/G9ps5GZEvOlZhlp8hyxx8liLf7cMkMk5aL8NiCUGLgEdCkZF6/+cUdl
Ic6Uzejv3Ib01a4eEthgZ4q2YIBzHIwUyS8wXfOxU84bdz9UuD02ntlaan0c+yGs
AcdKS9QmvDP6u3pC29l9P7baMpoVOT8XlClj2DgyIS9iWHCF9ykwIoi64q/dYJsV
q0BXdxgsEQyQ6yaYTqbqv47lunHtC6QMxojMthXdLop2QaEqtG1KCPW/vH4DCQge
SmQfvBNGrlcDTYhiYN0amdYQocyNzw==
=fN/r
-----END PGP SIGNATURE-----

--ccmOgVpHzFycuB4lksp0rBhSsKN24q8c1--
