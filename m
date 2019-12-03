Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7710FF4A
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 14:54:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S3PK4RLNzDqXW
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 00:54:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Wsi8SqLd"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S3FL1dK1zDqTv
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 00:47:17 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1CABB43D79;
 Tue,  3 Dec 2019 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1575380833; x=
 1577195234; bh=5FS45RMmC28cHZYhE0uA5aU3Xs79sNCdYDR0IpGFcbE=; b=W
 si8SqLdqzQO7vhkXYT9W4kljss10oT6Yu1/s7JuyrJnkxHR69exxnKPndwJeC7Cc
 W24CA1M5MxGeWq/JHGEXOs+NqDmEVQ7DvxT8XmG3meUxOoTzPR8sdqWRVTLzpqxP
 LJmke8wW7AqUg669aAc4NIXRfKWGih1wGJ81k+o7rM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXPB4EmLy9tW; Tue,  3 Dec 2019 16:47:13 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 28389438D1;
 Tue,  3 Dec 2019 16:47:13 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 3 Dec
 2019 16:47:12 +0300
Subject: Re: Add sensors to S2600WF
To: AKASH G J <akashgj91@gmail.com>, <openbmc@lists.ozlabs.org>
References: <CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <8d01e563-586a-11f0-e7b9-6bd4436e371b@yadro.com>
Date: Tue, 3 Dec 2019 16:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KmWR6xdXL6nDcGv87gcs7IuhTe6qCiXXw"
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

--KmWR6xdXL6nDcGv87gcs7IuhTe6qCiXXw
Content-Type: multipart/mixed; boundary="MhBrpjDYbB4WbZfxzwWh5Y6F3ICctOWhp";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
Message-ID: <8d01e563-586a-11f0-e7b9-6bd4436e371b@yadro.com>
Subject: Re: Add sensors to S2600WF
References: <CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmail.com>
In-Reply-To: <CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmail.com>

--MhBrpjDYbB4WbZfxzwWh5Y6F3ICctOWhp
Content-Type: multipart/alternative;
 boundary="------------AB96FA405D5D92B8C358B6CA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AB96FA405D5D92B8C358B6CA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

03.12.2019 13:39, AKASH G J wrote:
> Hi all,
>
> I am using S2600WF configuration for BMC firmware.=C2=A0 We are having =
temperature
> sensors and ADC voltage monitors connected on board. All sensor reading=
s are
> shown on hwmon sysfs interface.
>
> But it is not coming when issuing IPMI commands.
>
> $ ipmitool -I dbus sdr type temperature
> $ ipmitool -I dbus sdr type voltage
>
> Is there anything to be done to make sure sensor values are reported ov=
er DBus.

For s2600wf it's best to use the version of OpenBMC from the
Intel-BMC repository (git@github.com:Intel-BMC/openbmc.git).
I'm using their clean_builds branch.

Use 'wolfpass' machine there instead of `s2600wf` and build
'intel-platforms' instead of 'phosphor-obmc-image'.

Sensors work for me that way via IPMI.

With best regards,
Alexander Amelkin


--------------AB96FA405D5D92B8C358B6CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    03.12.2019 13:39, AKASH G J wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmai=
l.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>Hi all,</div>
        <div><br>
        </div>
        <div>I am using S2600WF configuration for BMC firmware.=C2=A0 We =
are
          having temperature sensors and ADC voltage monitors connected
          on board. All sensor readings are shown on hwmon sysfs
          interface.</div>
        <div><br>
        </div>
        <div>But it is not coming when issuing IPMI commands.</div>
        <div><br>
        </div>
        <div>$ ipmitool -I dbus sdr type temperature</div>
        <div>$ ipmitool -I dbus sdr type voltage</div>
        <div><br>
        </div>
        <div>Is there anything to be done to make sure <span
            class=3D"gmail-il">sensor</span> values are reported over
          DBus.</div>
      </div>
    </blockquote>
    <p>For s2600wf it's best to use the version of OpenBMC from the<br>
      Intel-BMC repository (<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:git@github.com:Intel-BMC/openbmc.git">git@github.com:Intel-BMC/op=
enbmc.git</a>).<br>
      I'm using their clean_builds branch.</p>
    <p>Use 'wolfpass' machine there instead of `s2600wf` and build<br>
      'intel-platforms' instead of 'phosphor-obmc-image'.</p>
    <p>Sensors work for me that way via IPMI.<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"80">With best regards,
Alexander Amelkin</pre>
  </body>
</html>

--------------AB96FA405D5D92B8C358B6CA--

--MhBrpjDYbB4WbZfxzwWh5Y6F3ICctOWhp--

--KmWR6xdXL6nDcGv87gcs7IuhTe6qCiXXw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd5mdgAAoJEOiTWHtbdBeNK6sQAIiv0IHnAKfi0FP/n3cy5b2i
eJ2m35fGP9SxPulAK2i+utQanyJ3HOBjD6qo/mUadWdxQ08YCkMbPICDCGSzg0gl
y+iTeUXl0vBCUGkpJ6DDHnKUDlSt/e6EaYXUwRCa1m/PKdd+KE4JdIkxB249To1c
hxXtNCRps+SyNdUPbZvN+zVKwKBL39FkHeMS5qHU29Hko41bgy/eOpir2Nf2nep9
KlNFyV+jge320u5mo/8VPCgoMtNZJ967asI8Tkz7Lcfxc812DlsoOlYATwhBbDFY
9f7HE28o0URkuLoYU4t+ZcHAQpyyVFXM8DJaCr3q0VHvz5m3i/ccnCn9SVfdoSu/
ERfJaZvsKDEtqd4MKWWaQL/9Ama8qL8fwvWdRRdcLqSix2pO6dMy71uMx9rCEVvE
HKQ01OoupKf1U7z7tbhjOb2IPSAbCC9OqeS/VZZqZvsUsWx1eA6nJmFzhsNhHZMs
ts3kgvSvOjV9c/EnvNDh9vnwuLgFF73SMHcfTGolpJ1EHzm1EhHxTcxcxvnVHLiL
34lveDoWNc85/ewigNZMlzdllJrkJ4nkm2bxnzzYKzIJ1k76k5I9/SZ9+RrTq2xk
Rtm7ph3auTq/+pPpiQl5nGVDHV8PWqMYT4ohZ3MdUTW2deI/k7Ay8A510ISIhK/m
rYO54FvVNBRGM5kFyoKY
=VpeS
-----END PGP SIGNATURE-----

--KmWR6xdXL6nDcGv87gcs7IuhTe6qCiXXw--
