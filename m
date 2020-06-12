Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099A1F7B29
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 17:55:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k5112l7LzDqxc
	for <lists+openbmc@lfdr.de>; Sat, 13 Jun 2020 01:55:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k4zv3tpWzDqwn
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jun 2020 01:54:43 +1000 (AEST)
IronPort-SDR: VPckw6ZYKzeB+6IxVaXdl/D9LQuSXHcK9MbX149Y+99su2BChHyJdQRnwBEJGvycx14vNPJouW
 kGBV0KcX4Rcg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 08:54:40 -0700
IronPort-SDR: VimL+nMInhMF1SWITwtR9Kmbz0hJXsAhC8Tp4yUXs+iaN4GhqKukUYIG5QBE78Ktct8lPjyEe5
 Wrh7keM5xAsA==
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
 d="asc'?scan'208,217";a="315162160"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 08:54:39 -0700
Subject: Re: OpenBMC 2.8 Release
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 wak@google.com
References: <OF1080F77B.8EF587E4-ON0025857E.003665AE-6525857E.00366D57@LocalDomain>
 <OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@notes.na.collabserv.com>
 <5b3a91d9-531d-974a-fc39-489983dc22c4@linux.vnet.ibm.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Message-ID: <f0b9a991-24f0-a142-f167-d9d43260de8a@intel.com>
Date: Fri, 12 Jun 2020 08:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5b3a91d9-531d-974a-fc39-489983dc22c4@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Zv8e3RsjVdgW8BKzaw2mEPWPoESOtv5E7"
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
Cc: "Mauery, Vernon" <vernon.mauery@intel.com>,
 krtaylor <kurt.r.taylor@gmail.com>, Prashanth Katti1 <prkatti1@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Zv8e3RsjVdgW8BKzaw2mEPWPoESOtv5E7
Content-Type: multipart/mixed; boundary="0b9stiJLfzlByzOR90V50WNPer4EtXEM0"

--0b9stiJLfzlByzOR90V50WNPer4EtXEM0
Content-Type: multipart/alternative;
 boundary="------------E8179B8C5E0626B4933B8934"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8179B8C5E0626B4933B8934
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Tom,

I have not seen any defects concerning VLAN..... yet.
Testing this on my own system for the NCSI channel (e.g. lan id 1) our
BMC behaves in the same way as reported in issue 12.
I haven't tested/used VLAN in ages, and never on OBMC, so I can't say if
this is a regression.

On 6/12/20 8:11 AM, TOM JOSEPH wrote:
>
> Hello William,
>
> https://github.com/openbmc/phosphor-net-ipmid/issues/12
>
> This issue got reported on openbmc master which is needed for OpenBMC
> 2.8 release. The VLAN creation is failing via IPMI and the trace
> indicates the failure to delete the non static address.
> This had worked on the earlier 2.7 community release. I have not
> followed much the changes on the phosphor-networkd front.
> Since you had helped rewrite the transport handler. Can you help
> comment on the issue?
>
> Copying Johnathan, do you run into this on your platforms?
>
> Regards,
> Tom
>
> On 05-06-2020 15:53, Prashanth Katti1 wrote:
>> Hi All,
>> We tested Firmware version : 2.8.0-rc1-0-g35a774200 on Witherspoon,
>> and found following issues.
>>
>> DHCP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0- https://github.com/openb=
mc/bmcweb/issues/127
>> LDAP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -
>> https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html
>> VLAN via REST - https://github.com/openbmc/openbmc/issues/3668
>> VLAN via IPMI =A0 =A0 -
>> https://github.com/openbmc/phosphor-net-ipmid/issues/12
>>
>> Rest of the functionalities looks good and are stable in our testing.
>> Hope this input helps.
>>
>> Prashanth Katti
>>
>>
>>
>>
>> From: =A0 =A0 =A0 =A0krtaylor <kurt.r.taylor@gmail.com>
>> To: =A0 =A0 =A0 =A0OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Date: =A0 =A0 =A0 =A003-06-2020 00:46
>> Subject: =A0 =A0 =A0 =A0[EXTERNAL] Re: OpenBMC 2.8 Release
>> Sent by: =A0 =A0 =A0 =A0"openbmc"
>> <openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>
>> ----------------------------------------------------------------------=
--
>>
>>
>>
>> On 5/4/20 1:29 AM, Deepak Kodihalli wrote:
>> > On 04/05/20 10:43 am, Andrew Jeffery wrote:
>> >>
>> >>
>> >> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
>> >>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>> >>>> just add it directly here:
>> >>>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
>> >>> Added:
>> >>> =A0 * Yocto refresh to "Dunfell" version 3.1
>> >>> =A0 * Redfish support for: full certificate management, complete L=
DAP
>> >>> management, full sensor support, event service schema, task schema=

>> >>> =A0 * Move to Redfish Specification 1.9.0
>> >>> =A0 * Redfish support for 2019.4 Schemas
>> >>> =A0 * GUI enhancements: LDAP, certificate management
>>
>> We are targeting this Friday, June 5th for release 2.8. I'm not seeing=

>> much (or any) discussion on testing. If you have tested the release ta=
g
>> please post the results for your platform. Any blockers?
>>
>> https://github.com/openbmc/openbmc/releases
>>
>> Also, please review and add content to the release notes here:
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440
>>
>> Thanks everyone!
>>
>> Kurt Taylor (krtaylor)
>>
>> >>>
>> >>> And removed "`Redfish configuration backup and restore function`".=

>> >>> James, Jason are you okay with the Redfish list above? Should we a=
dd
>> >>> something about Storage & Drives? Anything else?
>> >>>
>> >>> Should we add something about the Kernel? "Move to 5.4"?
>> >>>
>> >>> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLD=
M
>> >>> Support" and "Partial MCTP Support".
>> >>
>> >> Certainly MCTP support is still "Partial". Slowly progressing with
>> >> help from
>> >> Intel.
>> >
>> > Same goes for PLDM. There's definitely more PLDM specs and commands
>> > implemented in libpldm since the 2.7 release though.
>> >
>> >> Andrew
>> >>
>> >
>>
>>
>>
>>
>>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>


--------------E8179B8C5E0626B4933B8934
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body>
    Tom,<br>
    <br>
    I have not seen any defects concerning VLAN..... yet.<br>
    Testing this on my own system for the NCSI channel (e.g. lan id 1)
    our BMC behaves in the same way as reported in issue 12.<br>
    I haven't tested/used VLAN in ages, and never on OBMC, so I can't
    say if this is a regression.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 6/12/20 8:11 AM, TOM JOSEPH wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:5b3a91d9-531d-974a-fc39-489983dc22c4@linux.vnet.ibm.com=
">
      <meta http-equiv=3D"Content-Type" content=3D"text/html;
        charset=3Dwindows-1252">
      <p>Hello William,</p>
      <p><a class=3D"moz-txt-link-freetext"
          href=3D"https://github.com/openbmc/phosphor-net-ipmid/issues/12=
"
          moz-do-not-send=3D"true">https://github.com/openbmc/phosphor-ne=
t-ipmid/issues/12</a></p>
      This issue got reported on openbmc master which is needed for
      OpenBMC 2.8 release. The VLAN creation is failing via IPMI and the
      trace indicates the failure to delete the non static address. <br>
      This had worked on the earlier 2.7 community release. I have not
      followed much the changes on the phosphor-networkd front.<br>
      Since you had helped rewrite the transport handler. Can you help
      comment on the issue?<br>
      <br>
      Copying Johnathan, do you run into this on your platforms?<br>
      <br>
      Regards,<br>
      Tom<br>
      <br>
      <div class=3D"moz-cite-prefix">On 05-06-2020 15:53, Prashanth Katti=
1
        wrote:<br>
      </div>
      <blockquote type=3D"cite"
cite=3D"mid:OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@not=
es.na.collabserv.com">
        <span style=3D" font-size:10pt;font-family:sans-serif">Hi All,</s=
pan><br>
        <span style=3D" font-size:10pt;font-family:sans-serif">We tested
          Firmware version : 2.8.0-rc1-0-g35a774200 on Witherspoon, and
          found following issues.</span><br>
        <br>
        <span style=3D" font-size:10pt;font-family:sans-serif">DHCP =A0 =A0=
 =A0
          =A0 =A0 =A0 =A0 =A0 =A0 =A0- </span><a
          href=3D"https://github.com/openbmc/bmcweb/issues/127"
          moz-do-not-send=3D"true"><span style=3D"
            font-size:10pt;color:blue;font-family:sans-serif">https://git=
hub.com/openbmc/bmcweb/issues/127</span></a><br>
        <span style=3D" font-size:10pt;font-family:sans-serif">LDAP =A0 =A0=
 =A0
          =A0 =A0 =A0 =A0 =A0 =A0 =A0 - </span><a
          href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-May/021=
702.html"
          moz-do-not-send=3D"true"><span style=3D"
            font-size:10pt;color:blue;font-family:sans-serif">https://lis=
ts.ozlabs.org/pipermail/openbmc/2020-May/021702.html</span></a><br>
        <span style=3D" font-size:10pt;font-family:sans-serif">VLAN via
          REST - </span><a
          href=3D"https://github.com/openbmc/openbmc/issues/3668"
          moz-do-not-send=3D"true"><span style=3D"
            font-size:10pt;color:blue;font-family:sans-serif">https://git=
hub.com/openbmc/openbmc/issues/3668</span></a><br>
        <span style=3D" font-size:10pt;font-family:sans-serif">VLAN via
          IPMI =A0 =A0 - </span><a
          href=3D"https://github.com/openbmc/phosphor-net-ipmid/issues/12=
"
          moz-do-not-send=3D"true"><span style=3D"
            font-size:10pt;color:blue;font-family:sans-serif">https://git=
hub.com/openbmc/phosphor-net-ipmid/issues/12</span></a><br>
        <br>
        <span style=3D" font-size:10pt;font-family:sans-serif">Rest of th=
e
          functionalities looks good and are stable in our testing.</span=
><br>
        <span style=3D" font-size:10pt;font-family:sans-serif">Hope this
          input helps.</span><br>
        <br>
        <span style=3D" font-size:10pt;font-family:sans-serif">Prashanth
          Katti</span><br>
        <br>
        <br>
        <br>
        <br>
        <span style=3D"
          font-size:9pt;color:#5f5f5f;font-family:sans-serif">From: =A0 =A0=

          =A0 =A0</span><span style=3D" font-size:9pt;font-family:sans-se=
rif">krtaylor
          <a class=3D"moz-txt-link-rfc2396E"
            href=3D"mailto:kurt.r.taylor@gmail.com" moz-do-not-send=3D"tr=
ue">&lt;kurt.r.taylor@gmail.com&gt;</a></span><br>
        <span style=3D"
          font-size:9pt;color:#5f5f5f;font-family:sans-serif">To: =A0 =A0=
 =A0
          =A0</span><span style=3D" font-size:9pt;font-family:sans-serif"=
>OpenBMC
          Maillist <a class=3D"moz-txt-link-rfc2396E"
            href=3D"mailto:openbmc@lists.ozlabs.org"
            moz-do-not-send=3D"true">&lt;openbmc@lists.ozlabs.org&gt;</a>=
</span><br>
        <span style=3D"
          font-size:9pt;color:#5f5f5f;font-family:sans-serif">Date: =A0 =A0=

          =A0 =A0</span><span style=3D" font-size:9pt;font-family:sans-se=
rif">03-06-2020
          00:46</span><br>
        <span style=3D"
          font-size:9pt;color:#5f5f5f;font-family:sans-serif">Subject: =A0=

          =A0 =A0 =A0</span><span style=3D"
          font-size:9pt;font-family:sans-serif">[EXTERNAL] Re: OpenBMC
          2.8 Release</span><br>
        <span style=3D"
          font-size:9pt;color:#5f5f5f;font-family:sans-serif">Sent by: =A0=

          =A0 =A0 =A0</span><span style=3D"
          font-size:9pt;font-family:sans-serif">"openbmc" <a
            class=3D"moz-txt-link-rfc2396E"
            href=3D"mailto:openbmc-bounces+gkeishin=3Din.ibm.com@lists.oz=
labs.org"
            moz-do-not-send=3D"true">&lt;openbmc-bounces+gkeishin=3Din.ib=
m.com@lists.ozlabs.org&gt;</a></span><br>
        <hr noshade=3D"noshade"><br>
        <br>
        <br>
        <tt><span style=3D" font-size:10pt">On 5/4/20 1:29 AM, Deepak
            Kodihalli wrote:<br>
            &gt; On 04/05/20 10:43 am, Andrew Jeffery wrote:<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:<b=
r>
            &gt;&gt;&gt; On 4/29/2020 10:48 AM, Kurt Taylor wrote:<br>
            &gt;&gt;&gt;&gt; just add it directly here:<br>
            &gt;&gt;&gt;&gt; </span></tt><a
          href=3D"https://github.com/openbmc/openbmc/wiki/Current-Release=
-Content"
          moz-do-not-send=3D"true"><tt><span style=3D" font-size:10pt">ht=
tps://github.com/openbmc/openbmc/wiki/Current-Release-Content</span></tt>=
</a><tt><span
            style=3D" font-size:10pt"><br>
            &gt;&gt;&gt; Added:<br>
            &gt;&gt;&gt; =A0 * Yocto refresh to "Dunfell" version 3.1<br>=

            &gt;&gt;&gt; =A0 * Redfish support for: full certificate
            management, complete LDAP<br>
            &gt;&gt;&gt; management, full sensor support, event service
            schema, task schema<br>
            &gt;&gt;&gt; =A0 * Move to Redfish Specification 1.9.0<br>
            &gt;&gt;&gt; =A0 * Redfish support for 2019.4 Schemas<br>
            &gt;&gt;&gt; =A0 * GUI enhancements: LDAP, certificate
            management<br>
            <br>
            We are targeting this Friday, June 5th for release 2.8. I'm
            not seeing <br>
            much (or any) discussion on testing. If you have tested the
            release tag <br>
            please post the results for your platform. Any blockers?<br>
            <br>
          </span></tt><a
          href=3D"https://github.com/openbmc/openbmc/releases"
          moz-do-not-send=3D"true"><tt><span style=3D" font-size:10pt">ht=
tps://github.com/openbmc/openbmc/releases</span></tt></a><tt><span
            style=3D" font-size:10pt"><br>
            <br>
            Also, please review and add content to the release notes
            here:<br>
            <br>
          </span></tt><a
          href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/324=
40"
          moz-do-not-send=3D"true"><tt><span style=3D" font-size:10pt">ht=
tps://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440</span></tt></a><t=
t><span
            style=3D" font-size:10pt"><br>
            <br>
            Thanks everyone!<br>
            <br>
            Kurt Taylor (krtaylor)<br>
            <br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; And removed "`Redfish configuration backup and
            restore function`".<br>
            &gt;&gt;&gt; James, Jason are you okay with the Redfish list
            above? Should we add<br>
            &gt;&gt;&gt; something about Storage &amp; Drives? Anything
            else?<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Should we add something about the Kernel? "Move
            to 5.4"?<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Anything for PLDM / MCTP? For the 2.7 release
            it says "Partial PLDM<br>
            &gt;&gt;&gt; Support" and "Partial MCTP Support".<br>
            &gt;&gt;<br>
            &gt;&gt; Certainly MCTP support is still "Partial". Slowly
            progressing with <br>
            &gt;&gt; help from<br>
            &gt;&gt; Intel.<br>
            &gt; <br>
            &gt; Same goes for PLDM. There's definitely more PLDM specs
            and commands <br>
            &gt; implemented in libpldm since the 2.7 release though.<br>=

            &gt; <br>
            &gt;&gt; Andrew<br>
            &gt;&gt;<br>
            &gt; <br>
            <br>
          </span></tt><br>
        <br>
        <br>
        <br>
      </blockquote>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html;
        charset=3Dwindows-1252">
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

--------------E8179B8C5E0626B4933B8934--

--0b9stiJLfzlByzOR90V50WNPer4EtXEM0--

--Zv8e3RsjVdgW8BKzaw2mEPWPoESOtv5E7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEVa822oZtYaVqAzq50EfviT3fHwkFAl7jpTsACgkQ0EfviT3f
Hwm9fggAltlexcRzcJQknH+n0jqlXPrCwZxqj0F/LkHrI8X7ThOBv5YyYs2i9nSk
+7YJCTywgRL9D8ZggfHkfbYXujZ03hPf7YgV5otKU5AhkKSE+A1g+7KfFvrRNorl
BVGFY6O4GJ4paNcyLseAPGSylhy4MdWK8sM4YyMI+0zsPhCcO0p7YMrGEwHWc2TB
QV9adkEpO+f1CA8gKXVw5L5we0JbpK0pTvJSMyIMILyTxjkkpKxjU2oy5Ft/8pRO
n9Ujr+lzKVXTGJl17lwgVGuZZuku2e3xZk6r6oa8jshsmrc5pIrj/zjxmWw83UIN
5R71akBNC8sEzyQLkt45LfRpKu9g+w==
=YBNC
-----END PGP SIGNATURE-----

--Zv8e3RsjVdgW8BKzaw2mEPWPoESOtv5E7--
