Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 609CCAD5B0
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 11:30:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RjZW1g2vzDqPW
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 19:30:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sd7v6DoI"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RjYr6rspzDq9s
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 19:30:08 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id f12so27004329iog.12
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yI1L7BznE+ORW+1DcmjeIWo2XUkx5qLvqIBz2NPz05o=;
 b=Sd7v6DoId4eOglEe6Zwxm+LXRpXki/chRiFggWqgD7dKylQnkfOS9k5XfaZ0c+3Abb
 8doSMS1H+EGloQPxZEM63cpIOG6ZSl24LN+J3B/wiCaVxc37k8rvYCLKPWZY9qRyrC6f
 Ni7Kd7CupQB2AprjXYYDIqSy0ao9q15n0PNWjuyCLU6mgQ2p0YXZ3cLXlX/GgxbK0/W+
 /dcgHKCaO4w0YHEs8kB2dJm38jVe/X6fSnZrk1k55bMqN7GQdzgUnZ2RIxzrHdnt9LUQ
 ss8/qLvidqTotTSVuXW+cLzbsZbJxTZ9HDuOxSUKzKuA3R5YbN05v6CkG5uixtEsExbs
 eNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yI1L7BznE+ORW+1DcmjeIWo2XUkx5qLvqIBz2NPz05o=;
 b=k63mILZ6V7NJVAierNt5puVgn8qxOwf5Y2G+8mNVObi61aQrzU5FtSNBE09bWpTwsp
 EqjL9OgDh5UIxKbUJbQssaiNPVvMxosGeSAkfUAocfYmIq7lghdQPWcy9e7ix6tq7fJl
 JpKCZO6fFis7yZ8GRbiEsy3MapnU4jeJiPQfyAfdHw9iLQwi9WvyrQNzK6cR155mD8rY
 m7Qnl/6E40TgWbVbx0JdR8C5mi4h5oic6kFCFc9IPXCzoscn0MCh2QXdOyTzBzr7uPXB
 XyxeWDoEI9DlOq5tmgmm3GK3I9qf0UgXX5t9JAk61/hZqsonXIqSw32/JXvkKKEHTysz
 wtbA==
X-Gm-Message-State: APjAAAVVAz/s2Cnhhuomis03YMRmw8NjdkL8yIQA9+OMrB7A6xmZOZAl
 P/XQ7fSX9yYP4HMowc/uIOtGfY69xULJTrIwrwM=
X-Google-Smtp-Source: APXvYqwYOJLevwORV+UBvFTeKy3KzPstsvxaPjgtHZhwomDGinuBg9kur9sW4D6Ckw6RQxPyP5akEw2/TKxBEIR2R6M=
X-Received: by 2002:a6b:9308:: with SMTP id v8mr14947138iod.221.1568021405310; 
 Mon, 09 Sep 2019 02:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <F188C00D-2748-4E5A-96E6-E09D316A0563@fb.com>
In-Reply-To: <F188C00D-2748-4E5A-96E6-E09D316A0563@fb.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 9 Sep 2019 17:29:53 +0800
Message-ID: <CAARXrt=ZuGf=5a-jd+dCf+e=M2q21YEGF5L5uzzRH3J6NYqFCQ@mail.gmail.com>
Subject: Re: Sdbusplus/tight memory conditions
To: Wilfred Smith <wilfredsmith@fb.com>
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

Is the size before strip or after strip?
I suspect it's not stripped so you get a quite large size.

On Mon, Sep 9, 2019 at 4:34 PM Wilfred Smith <wilfredsmith@fb.com> wrote:
>
> I=E2=80=99m having code size issues using the sdbusplus library. As I men=
tioned during the conference, I suspected it was a combinatorial expansion =
forced by the use of variant in a template. As a result, my =E2=80=9Ctiny=
=E2=80=9D FRU dumping utility uses almost 3 MB on Tioga Pass and can only b=
e stored on /tmp.. My sensor dumping utility, using the same structure by w=
ay of calling GetManagedObjects weighed in close to 9 MB, presumably becaus=
e there are several loops that walk the structure, with even more templated=
 function instantiation, which sux0rs when you only have a 32MB part. Even =
the best darn FRU utility in the world isn=E2=80=99t worth 25% of your avai=
lable code space.
>
> I hope I=E2=80=99m doing something wrong. The data structure is as recomm=
ended by Ed Tanous and I don=E2=80=99t see an obvious way to simplify the v=
ariant out of the structure. My current thoughts for proceeding are to (a) =
write my own task specific D-Bus library that isn=E2=80=99t as template-hap=
py or (b) to re-implement with low-level D-Bus calls. Neither is particular=
ly desirable since I would think all components should use the same library=
 to access the D-Bus
>
> My colleagues suspected I was statically linking the sdbusplus libraries,=
 but as I=E2=80=99ll prove in the next section, the bloat doesn=E2=80=99t o=
ccur until I have code that touches the D-Bus response, and the code size s=
cales directly with the number of variant types. That should be orthogonal =
to the penalty for linking statically, unless the template permutations are=
 in the library itself, but libsdbusplus.so is a meager 18,140 bytes.Code s=
ize here is increasing by 80,345 bytes per additional variant type, which i=
s 4x the size of the entire SO.
>
> My presumption is that I=E2=80=99m off in the weeds, and someone will kin=
dly guide me back to the main road.
>
> Experiment 1: A minimal application
> #include <iostream>
>
> int main( int argc, char *argv ) {
> std::cout << "Sizing app" << std::endl;
> }
>
> add_executable( sizing.bin source/sizing.cpp )
> target_link_libraries( sizing.bin sdbusplus.so )
> install( TARGETS sizing.bin )
>
> 104,828 bytes with or without link to sdbusplus.so
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Experiment 2: Add code to perform a GetManagedObjects. This increases the=
 code payload substantially more than expected, but is still reasonable.
>
> #include <iostream>
> #include <sdbusplus/bus.hpp>
>
>
> int main( int argc, char **argv ) {
> std::cout << "Sizing app" << std::endl;
>    auto bus =3D sdbusplus::bus::new_default_system();
>    auto method =3D bus.new_method_call("xyz.openbmc_project.FruDevice",
>                                         "/",
>                                         "org.freedesktop.DBus.ObjectManag=
er",
>                                         "GetManagedObjects");
>    auto response =3D bus.call(method);
>
> }
>
> add_executable( sizing.bin source/sizing.cpp )
> target_link_libraries( sizing.bin sdbusplus.so
>                                   systemd.so )
> install( TARGETS sizing.bin )
>
> 255,212 bytes
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94
> Experiment  3: Added the structure to read the result into, and the size =
grows too 10x. Note that I=E2=80=99m not even doing anything with the resul=
t. It=E2=80=99s the interaction between the =E2=80=9Cread=E2=80=9D and the =
storage type.
>
> #include <iostream>
> #include <sdbusplus/bus.hpp>
> #include <boost/container/flat_map.hpp>
>
> typedef sdbusplus::message::variant< std::string,
>                                      bool,
>                                      uint8_t,
>                                      int16_t,
>                                      uint16_t,
>                                      int32_t,
>                                      uint32_t,
>                                      int64_t,
>                                      uint64_t,
>                                      double,
>                                      std::vector<std::string>> AnyType;
>
> typedef boost::container::flat_map< std::string, AnyType> AnyTypeMap;
> typedef std::vector<std::pair<std::string, AnyTypeMap>> NamedArrayOfAnyTy=
peMaps;
> typedef std::vector<std::pair<sdbusplus::message::object_path, NamedArray=
OfAnyTypeMaps>> ArrayOfObjectPathsAndTieredAnyTypeMaps;
>
>
> int main( int argc, char **argv ) {
>    ArrayOfObjectPathsAndTieredAnyTypeMaps result;
>
> std::cout << "Sizing app" << std::endl;
>    auto bus =3D sdbusplus::bus::new_default_system();
>    auto method =3D bus.new_method_call("xyz.openbmc_project.FruDevice",
>                                         "/",
>                                         "org.freedesktop.DBus.ObjectManag=
er",
>                                         "GetManagedObjects");
>    auto response =3D bus.call(method);
>    response.read( result );
> }
>
> 2,274,736 bytes
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> Experiment 4: If I reduce the number of permutations to 2, the code paylo=
ad remains huge, but shrinks.
>
> #include <iostream>
> #include <sdbusplus/bus.hpp>
> #include <boost/container/flat_map.hpp>
>
> typedef sdbusplus::message::variant< std::string,
> //                                     bool,
> //                                     uint8_t,
> //                                     int16_t,
> //                                     uint16_t,
> //                                     int32_t,
> //                                     uint32_t,
> //                                     int64_t,
> //                                     uint64_t,
> //                                     double,
>                                      std::vector<std::string>> AnyType;
>
> typedef boost::container::flat_map< std::string, AnyType> AnyTypeMap;
> typedef std::vector<std::pair<std::string, AnyTypeMap>> NamedArrayOfAnyTy=
peMaps;
> typedef std::vector<std::pair<sdbusplus::message::object_path, NamedArray=
OfAnyTypeMaps>> ArrayOfObjectPathsAndTieredAnyTypeMaps;
>
>
> int main( int argc, char **argv ) {
>    ArrayOfObjectPathsAndTieredAnyTypeMaps result;
>
> std::cout << "Sizing app" << std::endl;
>    auto bus =3D sdbusplus::bus::new_default_system();
>    auto method =3D bus.new_method_call("xyz.openbmc_project.FruDevice",
>                                         "/",
>                                         "org.freedesktop.DBus.ObjectManag=
er",
>                                         "GetManagedObjects");
>    auto response =3D bus.call(method);
>    response.read( result );
> }
>
> 1,551,624 bytes
